{ lib, ... }:
let
  currentDir = builtins.path { path = ./.; };

  func = lib.mkOrder 1500 ''
    source ${currentDir}/func.zsh
  '';
in
{
  programs.git = {
    enable = true;

    ignores = [
      "*.log"
      ".DS_Store"
      "*.env"
      "__debug*"
      "bin"
      "scratch*"
      "tmp"
    ];

    settings = {
      color.branch = {
        current = "green";
        local = "blue";
        remote = "yellow";
      };

      color.status = {
        added = "cyan";
        changed = "magenta";
        untracked = "blue";
      };

      commit = {
        gpgsign = true;
      };

      core = {
        editor = "nvim";
        pager = "less -FN";
      };

      diff = {
        tool = "nvim";
      };

      difftool.nvim = {
        cmd = "nvim -d";
      };

      help = {
        autocorrect = 1;
      };

      init = {
        defaultBranch = "main";
      };

      pull = {
        rebase = true;
      };

      push = {
        autoSetupRemote = true;
      };

      url."git@github.com:" = {
        insteadOf = "https://github.com/";
      };

      user = {
        name = "Pawel Darulewski";
        email = "pawel.darulewski@gmail.com";
      };
    };
  };

  programs.zsh = {
    initContent = lib.mkMerge [ func ];
    shellAliases = {
      ga = "git add";
      gaa = "git add --all";

      gcb = "git checkout -b";
      gco = "git checkout";

      gbd = "git branch -D";

      gst = "git status";

      gcm = "git commit -m";

      grbc = "git rebase --continue";

      gl = "git log --oneline --decorate --graph";

      gp = "git pull";
      gpom = "git pull origin main";

      gpu = "git push";
      gpuf = "git push --force-with-lease";

      gsa = "git stash --all";
      gsp = "git stash pop";
      gsd = "git stash drop";

      gcp = "git cherry-pick";
    };
  };
}
