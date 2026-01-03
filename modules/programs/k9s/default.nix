{themes, ...}: {
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

    settings = {
      k9s = {
        ui = {
          headless = true;
          logoless = true;
          skin = "theme";
        };
      };
    };

    skins = {
      theme = "${themes.k9s}/skins/rose-pine-moon.yaml";
    };
  };
}
