{...}: {
  den.aspects.k9s.homeManager = {
    lib,
    pkgs,
    ...
  }: let
    k9s = pkgs.fetchFromGitHub {
      owner = "derailed";
      repo = "k9s";
      rev = "558caafe7ba067467de46b320cc22ef11fef9c34";
      hash = "sha256-70Rfu1BVd/QnwWXRRpwIeZ2UJNWIGixpdiOHo4v7adA=";
    };
  in {
    programs.k9s = {
      enable = true;

      aliases = {
        cm = "configmaps";
        cr = "clusterroles";
        crb = "clusterrolebindings";
        dp = "deployments";
        ev = "events";
        jo = "jobs";
        ns = "namespaces";
        np = "networkpolicies";
        po = "pods";
        rb = "rolebindings";
        ro = "roles";
        sa = "serviceaccounts";
        srv = "services";
        sec = "v1/secrets";
      };

      plugins = {
        hlLogs = {
          args = [
            "-c"
            "kubectl logs --follow --context=$CONTEXT --namespace=$NAMESPACE $RESOURCE_NAME/$NAME | hl --paging=never"
          ];
          shortCut = "Ctrl-Shift-L";
          confirm = false;
          description = "Logs (hl)";
          scopes = [
            "daemonset"
            "deploy"
            "job"
            "pod"
            "replicaset"
            "service"
            "statefulset"
          ];
          command = "sh";
          background = false;
        };

        jqlogs = {
          shortCut = "Shift-L";
          confirm = false;
          description = "Logs (jq)";
          scopes = ["pod"];
          command = "sh";
          background = false;
          args = [
            "-c"
            "kubectl logs -f $NAME -n $NAMESPACE --context $CONTEXT | jq -SR '. as $line | try (fromjson) catch $line'"
          ];
        };

        jqlogsd = {
          shortCut = "Shift-L";
          confirm = false;
          description = "Logs (jq)";
          scopes = ["deployment"];
          command = "sh";
          background = false;
          args = [
            "-c"
            "kubectl logs -f deployment/$NAME -n $NAMESPACE --context $CONTEXT | jq -SR '. as $line | try (fromjson) catch $line'"
          ];
        };

        jqlogss = {
          shortCut = "Shift-L";
          confirm = false;
          description = "Logs (jq)";
          scopes = ["service"];
          command = "sh";
          background = false;
          args = [
            "-c"
            "kubectl logs -f service/$NAME -n $NAMESPACE --context $CONTEXT | jq -SR '. as $line | try (fromjson) catch $line'"
          ];
        };
      };

      settings = {
        k9s = {
          ui = {
            headless = true;
            logoless = true;
            skin = "rose-pine-moon";
          };
        };
      };
    };

    xdg.configFile."k9s/skins/rose-pine-moon.yaml".source = "${k9s}/skins/rose-pine-moon.yaml";
  };
}
