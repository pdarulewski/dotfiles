let name = "Pawel Darulewski";
    email = "pawel.darulewski@gmail.com"; in
{
    enable = true;
    userName = name;
    userEmail = email;
    lfs = {
      enable = true;
    };
    ignores = [
      # MacOS
      ".DS_Store"

      # Build
      "bin/"
      "__debug_bin*"
      "target/"
      "*.pyc"
      "dist"

      # Dependencies
      ".venv"

      # Files
      "*.log"
      "scratch*"
      ".env"
    ];
    extraConfig = {
      init = {
        defaultBranch = "main";
      };

      core = {
        editor = "nvim";
      };

      help = {
        autocorrect = 1;
      };

      commit = {
        gpgsign = true;
      };

      push = {
        autoSetupRemote = true;
      };

      pull = {
        rebase = true;
      };

      rerere = {
        enabled = true;
      };

      color = {
        "branch" = {
          current = "green";
          local = "blue";
          remote = "yellow";
        };

        "status" = {
          added  = "cyan";
          changed  = "magenta";
          untracked  = "blue";
        };
      };

      filter = {
        "lfs" = {
          clean = "git-lfs clean -- %f";
          smudge = "git-lfs smudge -- %f";
          process = "git-lfs filter-process";
          required = true;
        };
      };

      includeIf = {
        "gitdir:~/repo/**" = {
          path = "~/repo/maintenance";
        };
      };

      url = {
        "git@github.com:" = {
          insteadOf = "https://github.com/";
        };
      };
    };
}
