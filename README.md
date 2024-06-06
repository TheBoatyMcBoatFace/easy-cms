# Hey Hey CMS

A meh script that makes it easier to connect to `cloudvpn.cms.gov`. It solves the headaches of using the zScaler and Cisco stuff. This assumes you are using a YubiKey, if not, things may break.

TODO: Check if this actually works for zScaler...

_This isn't official govy code_

## Getting Started

I could put this in the script, but just do the below before running `./hey_hey_cms.sh`

1. Install things
   `brew install expect totp-cli openconnect`

2. Setup `totp-cli`
   You need to create a namespace. Do this by... TODO

3. Setup YubiKey auth for your Mac. I think I have a guide somewhere. I'll post it laterish.

## SUPER DUPER IMPORTANT

This project uses all the secure things. I automated it sending the commands so that it just _works_, but please *don't be dumb*.

|  Variable  | What it is                                |
| :--------: | :---------------------------------------- |
| ROOT_PASS  | Your computer's password                  |
| USER_NAME  | Your CMS username, the 4 character one    |
|  PASSWORD  | Your CMS password, the 8 character one    |
| TOKEN_PASS | The MFA token you got in the CMS email    |
| NAMESPACE  | The totp-cli namespace, just keep `cms`   |
|  ACCOUNT   | The totp-cli account, just keep `vpn`     |
| TOKEN_PASS | Used to secure totp-cli, roll your own... |

## Resources

[OpenConnect Docs](https://www.infradead.org/openconnect/manual.html)

[Totp-CLI](https://yitsushi.github.io/totp-cli/)

## Contributing

Yea, feel free to submit changes if you'd like. It is mostly a thing to make life easier and is a pretty niche script.

## License

I use AGPL v3.0 so people can't take my stuff and not yeet changes back. Do what you want, but any improvments gotta be open source :)

Don't be a jerk

[Read It](LICENSE)
