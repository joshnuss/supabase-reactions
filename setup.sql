drop table if exists reaction_summaries;
drop table if exists reactions;

create table reactions (
    id serial primary key,
    scope varchar not null,
    user_id uuid references auth.users not null,
    emoji varchar not null,
    inserted_at timestamp with time zone default timezone('utc'::text, now()) not null,
    deleted_at timestamp with time zone
);

create unique index reactions$main on reactions (scope, user_id, emoji);

create policy "Individuals can create reactions." on reactions for
    insert with check (auth.uid() = user_id);


create table reaction_summaries (
    scope varchar not null,
    emoji varchar not null,
    count bigint not null
);

create unique index reaction_summaries$main on reaction_summaries (scope, emoji);

alter table reaction_summaries  replica identity using index reaction_summaries$main;

create or replace function increment_reaction(scope varchar, emoji varchar)
returns boolean
language plpgsql security definer
as $$
#variable_conflict use_column
begin
  if exists (select 1 from reactions as r where r.user_id = auth.uid() and r.scope = increment_reaction.scope and r.emoji = increment_reaction.emoji and r.deleted_at is not null) then
    update reactions as r set deleted_at = null where user_id = auth.uid() and r.scope = increment_reaction.scope and r.emoji = increment_reaction.emoji;
  else
    insert into reactions (user_id, scope, emoji) values (auth.uid(), increment_reaction.scope, increment_reaction.emoji);
  end if;

  insert into reaction_summaries (scope, emoji, count)
    values (increment_reaction.scope, increment_reaction.emoji, 1)
  on conflict (scope, emoji) do
    update set count = reaction_summaries.count + 1;

  return true;
end;
$$;

create or replace function decrement_reaction(scope varchar, emoji varchar)
returns boolean
language plpgsql security definer
as $$
#variable_conflict use_column
begin
  if exists (select 1 from reactions as r where r.user_id = auth.uid() and r.scope = decrement_reaction.scope and r.emoji = decrement_reaction.emoji and r.deleted_at is null) then
    update reactions as r set deleted_at = now() where user_id = auth.uid() and r.scope = decrement_reaction.scope and r.emoji = decrement_reaction.emoji;

    update reaction_summaries
      set count = count - 1
      where reaction_summaries.scope = decrement_reaction.scope and reaction_summaries.emoji = decrement_reaction.emoji;

    return true;
  end if;

  return false;
end;
$$;
