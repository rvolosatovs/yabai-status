flake:
{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.services.yabai-status;
in
{
  options.services.yabai-status = {
    enable = lib.mkEnableOption "yabai-status menu bar indicator";

    package = lib.mkOption {
      type = lib.types.package;
      default = flake.packages.${pkgs.stdenv.hostPlatform.system}.yabai-status;
      description = "The yabai-status package to use.";
    };
  };

  config = lib.mkIf cfg.enable {
    launchd.user.agents.yabai-status = {
      path = [ config.environment.systemPath ];
      serviceConfig = {
        ProgramArguments = [ "${cfg.package}/bin/yabai-status" ];
        RunAtLoad = true;
        KeepAlive = true;
      };
    };
  };
}
