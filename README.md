# bondrix-clock
A customizable clock that syncs the FiveM's server time and date to a specified timezone.

## Features
- Clock updates in real time, reflecting changes in time and date as they occur.
- Minimal impact on server and client performance with efficient synchronization, making it as lightweight as possible.

## Installation
### Manual
- Download the script and put it in the `[bondrix]` or `resources` directory.
- Add the following code to your `server.cfg`.
```
ensure bondrix-clock
```

## Configuration
Every configuration option along with its explainations can be found in [src/shared/config.lua](https://github.com/bondrix/bondrix-clock/blob/main/src/shared/config.lua).