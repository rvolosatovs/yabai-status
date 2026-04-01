# yabai-status

A minimal macOS menu bar indicator that displays the current [yabai](https://github.com/koekeishiya/yabai) space number.

## Requirements

- macOS 13+
- [yabai](https://github.com/koekeishiya/yabai) installed and running

## Usage with nix-darwin

Add the flake as an input and enable the module:

```nix
{
  inputs = {
    yabai-status.url = "github:rvolosatovs/yabai-status";
  };
}
```

Then in your nix-darwin configuration:

```nix
{
  imports = [inputs.yabai-status.darwinModules.default];

  services.yabai-status.enable = true;
}
```

This installs the binary and sets up a launchd agent to run it on login.

## Build manually

```sh
nix build
# or without flakes
swift build -c release
```
