{ user, ... }:

{
  # Determinate already manages the Nix daemon, so nix-darwin shouldn't.
  nix.enable = false;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "aarch64-darwin"; # use x86_64-darwin for Intel CPU

  system.primaryUser = user;
  users.users.${user} = {
    home = "/Users/${user}";
  };
  system.stateVersion = 6;
  system.defaults = {
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      KeyRepeat = 2;          # fast key repeat
      InitialKeyRepeat = 15;  # short delay before repeat
      _HIHideMenuBar = true;  # auto-hide the menu bar
      AppleShowAllExtensions = true;
    };
    dock.autohide = true;
    finder.FXPreferredViewStyle = "Nlsv";  # list view by default
    finder.CreateDesktop = false;          # clean desktop
    trackpad.Clicking = true;              # tap to click
  };
  nix-homebrew = {
    enable = true;
    inherit user;
    autoMigrate = true;
  };
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";  # remove anything not listed here
    onActivation.autoUpdate = true;
    onActivation.extraFlags = [ "--force" ];
    taps = [
      "logicnow/tap"
    ];
    brews = [
      # core dev
      "gh"
      "git"
      "commitizen"
      "pre-commit"
      "ggshield"
      "gum"
      "wget"
      "curl"
      "tmux"
      "fswatch"
      "graphviz"
      "grpcurl"
      "yq"
      "tree-sitter"
      "herdr"
      # kubernetes / infra
      "kubernetes-cli"
      "helm"
      "kubectx"
      "kustomize"
      "k9s"
      "istioctl"
      "skaffold"
      "tilt"
      # terraform / cloud
      "terraform"
      "terraform-docs"
      "tfenv"
      "tfswitch"
      "trivy"
      "osv-scanner"
      "gosec"
      "awscli"
      # go tooling
      "go"
      "golangci-lint"
      "goreleaser"
      "golang-migrate"
      "go-air"
      "protoc-gen-go"
      "protobuf"
      # data / messaging
      "kafka"
      "postgresql@14"
      "liquibase"
      # build / misc
      "k6"
      "maven"
      "groovy"
      "semtag"
      "pinentry-mac"
      "upx"
      "yamllint"
      "uv"
      "pipx"
      "node"
      "python@3.13"
      "openjdk"
      "openjdk@17"
      "rtk"
      "anvil"
    ];
    casks = [
      "wezterm"
      "claude-code"
      "postman"
      "chipmunk"
      "copilot-cli"
      "git-credential-manager"
      "font-jetbrains-mono-nerd-font"
    ];
  };
}
