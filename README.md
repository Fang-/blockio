# Block.io for Urbit

[Fora post for discussion.](https://urbit.org/fora/posts/~2017.8.14..00.54.52..f06a~)

## Setting up

To get set up, you need a few things.

1. Create an account on [block.io](https://block.io). Optionally put some coins in there.
2. ~Make sure [this change](https://github.com/urbit/arvo/pull/416/files) has made it onto your ship. This allows you to use capitals in your `web.plan` usernames, necessary for representing cryptocurrency addresses. (This may or may not have gotten pushed out over the network already. Comets that existed before this post will have to manually put it in.)~  
The change should have been pushed to all planets, and be included in all new comets.
3. Checkout or download [all the files](https://github.com/Fang-/blockio) for this, and put them into your ship's home desk. (In the future, I can probably set things up so that you can `|sync %home ~palfun-foslup %blockio` or something.)
4. `|start %blockio`. You can now ctrl-x to and from in, just like talk and dojo.
5. Select the coin you want to work with by doing `coin doge` or similar. Enter your API key for the current coin by entering `key xxxx-xxxx-xxxx-xxxx`. If you want to make transactions, also put in your block.io pin. `pin your-secret`.
6. To set a receiving address for the current coin, `address ...` will append it to your `web.plan`.

(Note that if all you want to do is receive tips without sending them, like some greedy shibe, having the updated `mar/plan.hoon` and manually putting in your address into your `web.plan` is sufficient. (Format `DOGE: [address]` on a single line.))

## Functionality

* Get help with `help`. Described all of the below.
* Switch between coins with `coin [currency]`.
* Get balance for the current coin with `balance`.
* Make transfers with `transfer [address] [amount]`. Address can be either a crypto address or a ship name.
* To enable talk listening, type `talk y`. The app will make transfers whenever you type `!tip [~ship_name] [amount] [currency]` into talk, as long as that message gets echoed back to you. Note that comet shortnames (with the underscore) are also supported, assuming that comet has sent a message since the block.io app has started watching talk.

Note that when making transfers to shipnames, you'll see a bunch of `%camping` printfs scroll by. These are from ford, indicating it's waiting on the `web.plan` from the foreign ship to be retrieved.
