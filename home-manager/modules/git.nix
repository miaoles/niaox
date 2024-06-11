{ niaox, ... }:

{
      programs.git = {
            enable = true;
            userName = "miaoles";
            userEmail = niaox.user.email;
            extraConfig = {
                  init.defaultBranch = "main";
                  credential.helper = "cache";
            };
      };
}
