<script>
  import { onMount } from 'svelte'
  import { supabase, subscribe, getCount, checkReaction, increment, decrement } from './reactions'

  export let icon = null
  export let emoji = '❤'
  export let title = 'like'
  export let scope = window.location.pathname

  let count = 0, reacted = false, loading = true

  subscribe(scope, emoji, (results) => console.log('subscription', results))

  onMount(() => {
    loadCount()
  })

  async function handleClick() {
    if (!supabase.auth.currentUser) {
      supabase.auth.signIn({provider: 'github'})
      return
    }

    if (reacted) {
      count -= 1
      reacted = false
      await decrement(scope, emoji)
    }
    else {
      count += 1
      reacted = true
      await increment(scope, emoji)
    }

    await loadCount()
  }

  async function loadCount() {
    count = await getCount(scope, emoji)
    reacted = await checkReaction(scope, emoji)
    loading = false
  }
</script>

{#if !loading}
  <button {title} on:click={handleClick} class="flex hover:text-red-600">
    <slot selected={reacted}>
      {emoji}
    </slot>

    <div class="text-xl self-center">
      {count}
    </div>
  </button>
{/if}

<style>
  button:focus {
    outline: none;
  }
</style>
