{...}: {
  programs.lazygit = {
    enable = true;

    enableZshIntegration = true;

    settings = {
      customCommands = [
        {
          key = "C";
          command = "git cz c";
          description = "commit with commitizen";
          context = "files";
          loadingText = "opening commitizen commit tool";
          output = "terminal";
        }
        {
          key = "R";
          command = ''git checkout HEAD -- {{.SelectedFile.Name | quote}}'';
          description = "restore file";
          context = "files";
          loadingText = "restore file";
          output = "terminal";
        }
        {
          key = "W";
          prompts = [
            {
              type = "input";
              title = "Commit";
              initialValue = "";
            }
          ];
          command = ''git commit -m "{{index .PromptResponses 0}}" --no-verify'';
          context = "global";
          output = "terminal";
        }
        {
          key = "<c-g>";
          command = "gh pr create";
          context = "global";
          loadingText = "Creating pull request on GitHub";
          output = "terminal";
        }
        {
          key = "E";
          prompts = [
            {
              type = "input";
              title = "Add empty commit";
              initialValue = "fix: ";
            }
          ];
          command = ''git commit --allow-empty -m "{{index .PromptResponses 0}}"'';
          context = "global";
          output = "terminal";
        }
      ];

      git = {
        pagers = [
          {
            pager = "delta --dark --paging=never";
          }
        ];
      };

      gui = {
        theme = {
          activeBorderColor = ["#f5bde6" "bold"];
          inactiveBorderColor = ["#a5adcb"];
          optionsTextColor = ["#8aadf4"];
          selectedLineBgColor = ["#363a4f"];
          cherryPickedCommitBgColor = ["#494d64"];
          cherryPickedCommitFgColor = ["#f5bde6"];
          unstagedChangesColor = ["#ed8796"];
          defaultFgColor = ["#cad3f5"];
          searchingActiveBorderColor = ["#eed49f"];
        };
        authorColors = {
          "*" = "#b7bdf8";
        };
      };
    };
  };
}
