<script>
  import Reaction from './Reaction.svelte'
</script>

<div class="my-10 mx-5 sm:mx-10 md:mx-auto md:w-1/2 text-gray-600 flex flex-col h-screen gap-4">
  <h1 class="text-4xl font-medium">Realtime emoji reactions with Supabase</h1>

  <p class="text-sm text-gray-500">Jan 1, 2021 &bull; 1min read &bull; by <a class="underline" href="https://twitter.com/joshnuss">@joshnuss</a></p>

  <p class="mt-10">This is an example of using supabase to create a realtime reaction widget like the one at the <a href="#bottom" class="underline">bottom of the article</a>.</p>
  <p>When you click the reaction button, a record is inserted into the remote db. The record is keyed by user_id, scope, and emoji.</p>

  <p>The code looks like this:</p>

  <pre class="bg-gray-200 p-3 rounded-sm">
    &lt;Reaction emoji='❤' scope={'{'}window.location.pathname{'}'}/&gt;
  </pre>

  Or you can use a custom SVG:

  <pre class="bg-gray-200 p-3 rounded-sm">
    &lt;Reaction scope={'{'}window.location.pathname{'}'}&gt;
  &lt;svg&gt;...&lt;/svg&gt;
&lt;/Reaction&gt;
  </pre>

  <p>The scope is any unique value. For example if you want to add reaction to a comment, you can use "comment:&lt;comment-id&gt;", any string will work.</p>

  <p>When a user clicks the reaction button, they are redirected to authenticate via OAUTH.</p>

  <div id="bottom" class="flex gap-2 my-4">
    <Reaction let:selected>
      <svg class:selected height=28 width=28 xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
      </svg>
    </Reaction>

    <Reaction emoji="🦄" title="unicorn" let:selected>
      <svg class:selected height=28 width=28 viewBox="0 0 72 72" xmlns="http://www.w3.org/2000/svg">
        <g id="color">
          <path fill="#FFFFFF" stroke="none" d="M23.7544,12.3618l1.6667,7.1667l-5.3333,5.3333l-8.3333,14.3333l1,4.6667l2.1667,1.3333l4-0.1667 l3.5-3.3333l6.8333-1.8333c0,0,1.3333,1.5,2.1667,3s3.6667,4.1667,3.6667,4.1667l0.5,6l-1.8333,6.1667l-2,2.8333 c0,0,22,9.5,33.1667-7l-0.5-6l-1.8333-5l-3.3333-5.1667l-1-1.5l-0.1667-5.1667l-2.8333-5.3333l-5-3l-2.6667-4.5l-5.1667-4.1667 l-6.5-1.5l-5.6667,1l-4.1667-2.1667L23.7544,12.3618z"/>
          <path fill="#EA5A47" stroke="none" d="M50.671,23.155l5.2083,4.095c0,0,5.5638,8.2181-0.3258,17.8201c-7.0492,11.4924,0,0,0,0 c-1.6183,3.4754-2.3141,6.7423-1.738,9.7216l-5.3111-4.4167V34.2917L50.671,23.155z"/>
          <polyline fill="#EA5A47" stroke="none" points="25.8985,19.2712 10.7847,12.0212 15.951,18.1399 21.1747,23.995 25.8985,19.2712"/>
          <path fill="#92D3F5" stroke="none" d="M29.7367,13.6311l10.7677,0.1362c0,0,9.2377,4.0661,10.5355,11.8161l0.6874,8.9567 c-2.6337,6.5386-3.0562,14.1267,2.0883,20.8336l0,0c0,0-7.1444,1.3215-9.8944-7.1094L42.3377,43.5l0.3258-6.0341l1.4169-5.6426 l-0.2833-4.8929l-2.2761-4.3124l-3.5322-2.8413l-5.792-2.0801L29.7367,13.6311"/>
          <path fill="#61B2E4" stroke="none" d="M58.4549,36.75c0,0,5.5192,6.4066,6.9982,15.1193c0.1838,1.0826,0.1251,2.193-0.1377,3.2591 c-0.4317,1.7512-0.8179,4.9979,0.1452,7.3825c0.4689,1.1611-0.5621,2.3655-1.7883,2.1115 c-3.7094-0.7686-9.2437-3.6474-10.2567-8.0876c-0.0239-0.1047-0.0368-0.2138-0.0417-0.321l-0.266-5.7459 c-0.0132-0.2857,0.0516-0.5695,0.1875-0.8211l3.692-6.8359c0.0666-0.1233,0.1164-0.2549,0.1482-0.3914L58.4549,36.75"/>
        </g>
        <g id="hair"/>
        <g id="skin"/>
        <g id="skin-shadow"/>
        <g id="line">
          <path fill="none" stroke="#000000" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" stroke-width="2" d="M58.4549,37.7826C60.2229,40.1443,65,44.4647,64.5,54.0208"/>
          <path fill="none" stroke="#000000" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" stroke-width="2" d="M32.5,41.8854c0,0,8.4783,6.7823,0,18.7647"/>
          <polyline fill="none" stroke="#000000" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" stroke-width="2" points="24.809,19.1338 10.25,11.75 21.1747,23.995"/>
          <path fill="none" stroke="#000000" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" stroke-width="2" d="M35.1962,30.8696c0.5489,8.3555-9.3225,9.703-11.954,10.3347c-0.3325,0.0798-0.6318,0.25-0.8736,0.4919l-2.2227,2.2227 c-0.3494,0.3494-0.8234,0.5458-1.3176,0.5458h-3.5121c-1.203,0-2.2711-0.7698-2.6515-1.9111l-0.531-1.5931 c-0.258-0.774-0.1649-1.6222,0.2549-2.3218l8.7862-14.6436l4.7238-4.7238l-2.1151-6.9054c0,0,7.8026-0.6987,8.4135,5.3308 c0,0,16.9281,2.4418,10.5531,19.383c0,0-1.625,5.9489,2.375,11.1846"/>
          <path fill="none" stroke="#000000" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" stroke-width="2" d="M30.9167,14.0208c0,0,22.2444-4.0208,19.9583,19.9583"/>
          <path fill="none" stroke="#000000" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" stroke-width="2" d="M49.9187,23.155c0,0,14.7665,6.5865,5.4563,22.22c0,0-5.375,6.5625,0.625,13.6042"/>
          <circle cx="24.4167" cy="28.9304" r="2" fill="#000000" stroke="none"/>
        </g>
      </svg>
    </Reaction>

    <Reaction let:selected title="lol" emoji="😆">
      <svg class:selected width=28 height=28 viewBox="0 0 72 72" xmlns="http://www.w3.org/2000/svg">
        <g id="color">
          <circle cx="36" cy="36" r="23" fill="#fcea2b"/>
          <path fill="#fff" d="M50.595,41.64a11.5554,11.5554,0,0,1-.87,4.49c-12.49,3.03-25.43.34-27.49-.13a11.4347,11.4347,0,0,1-.83-4.36h.11s14.8,3.59,28.89.07Z"/>
          <path fill="#ea5a47" d="M49.7251,46.13c-1.79,4.27-6.35,7.23-13.69,7.23-7.41,0-12.03-3.03-13.8-7.36C24.2951,46.47,37.235,49.16,49.7251,46.13Z"/>
        </g>
        <g id="hair"/>
        <g id="skin"/>
        <g id="skin-shadow"/>
        <g id="line">
          <polyline fill="none" stroke="#000" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" points="25.168 27.413 31.755 31.427 25.168 35.165"/>
          <polyline fill="none" stroke="#000" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" points="46.832 27.413 40.245 31.427 46.832 35.165"/>
          <circle cx="36" cy="36" r="23" fill="none" stroke="#000" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"/>
          <path fill="none" stroke="#000" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M50.595,41.64a11.5554,11.5554,0,0,1-.87,4.49c-12.49,3.03-25.43.34-27.49-.13a11.4347,11.4347,0,0,1-.83-4.36h.11s14.8,3.59,28.89.07Z"/>
          <path fill="none" stroke="#000" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M49.7251,46.13c-1.79,4.27-6.35,7.23-13.69,7.23-7.41,0-12.03-3.03-13.8-7.36C24.2951,46.47,37.235,49.16,49.7251,46.13Z"/>
        </g>
      </svg>
    </Reaction>
  </div>
</div>

<style>
  svg {
    filter: grayscale(100%)
  }

  svg.hover {
    filter: drop-shadow(10px 1px 10px red);
    transform: scale(1.5);
  }

  .selected {
    fill: red;
    stroke: #d00;
    filter: none;
    animation: scale 0.3s ease;
  }

  @keyframes scale {
    from { transform: scale(1) }
    50% { transform: scale(1.5) }
    to { transform: scale(1) }
  }
</style>
