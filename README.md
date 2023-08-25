# Requires WoLua
This is a [WoLua](https://github.com/PrincessRTFM/WoLua) command script for FFXIV. You will need to install the WoLua plugin via Dalamud (instructions at link) in order to use it.

![GitHub last commit (branch)](https://img.shields.io/github/last-commit/PrincessRTFM/WoLua.gearsnap/master?label=updated)
[![GitHub issues](https://img.shields.io/github/issues-raw/PrincessRTFM/WoLua.gearsnap?label=known%20issues)](https://github.com/PrincessRTFM/WoLua.gearsnap/issues?q=is%3Aissue+is%3Aopen+sort%3Aupdated-desc)

[![Support me!](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/V7V7IK9UU)

## Usage
Just like the vanilla `/gearset change <gearset> [<glamour>]` command, you need to pass a gearset number and _optionally_ follow it with a glamour plate number. The script will automatically handle checking whether you've unlocked the `/snap` emote, and will skip trying to use it if you haven't. If you're currently moving, the animation won't play, so the emote will also be skipped in this case. Finally, you can hold SHIFT (either side) as an override to forcibly skip the snap emote, in case you want to change gearsets quickly. In all other cases, the script will execute `/snap motion` with a short delay (about a second and a half) to give the animation time to run, then change to the specified gearset (and glamour, if provided).
