import { createClient } from '@supabase/supabase-js'

export const supabase = createClient('https://cjwynfmpcupyrksdbghl.supabase.co', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYxMDU0NTMwNiwiZXhwIjoxOTI2MTIxMzA2fQ.sb8XQJ150MG0u17uhkK_wrK9GaFc4xxVd4NnQM8uGTQ')

export function subscribe(scope, emoji, callback) {
  supabase
    .from(`reaction_summaries:scope=eq.${scope}`)
    .on('*', data => {
      console.log(data)
      if (data.new.emoji == emoji) {
        callback(data.new)
      }
    })
    .subscribe()
}

export async function getCount(scope, emoji) {
  const {body: [record]} = await supabase
    .from('reaction_summaries')
    .select('count')
    .eq('scope', scope)
    .eq('emoji', emoji)

  return record == undefined ? 0 : record.count
}

export async function checkReaction(scope, emoji) {
  const {body: [reaction]} = await supabase
    .from('reactions')
    .select('*')
    .eq('scope', scope)
    .eq('emoji', emoji)
    .is('deleted_at', null)

  return reaction != undefined
}

export async function increment(scope, emoji) {
  await supabase
    .rpc('increment_reaction', {scope, emoji})
}

export async function decrement(scope, emoji) {
  await supabase
    .rpc('decrement_reaction', {scope, emoji})
}
