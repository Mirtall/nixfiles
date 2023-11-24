{ pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "Ethan Zouzoulkowsky";
    userEmail = "ethan.zouzoulkowsky@gmail.com";

    ignores = [
      "*.swp" # vim temp files
      "*~" # emacs temp files
      ".idea/" # JetBrains IDE folders
    ];

    extraConfig = {
      core = { editor = "vim"; };
      init = { defaultBranch = "main"; };
      pull = { rebase = true; };
      alias = {
        fire = "! git commit -m \"$(curl https://whatthecommit.com/index.txt)\"";
        cd = "switch";
        l = "log -20 --graph --format=\"%C(auto)%h %Cblue%an%C(auto)%d %C(brightblack)%ah %Cred%G?%n  %s\"";
      };

      signing = {
        signByDefault = true;
        key = "92571E374AE293CE";
      };

      commit.gpgsign = true;

      tag.gpgsign = true;
    };

    includes = [
      {
        condition = "gitdir:~/dev/prologin/";
        contents = {
          user = {
            email = "ethan.zouzoulkowsky@prologin.org";
          };
        };
      }

      {
        condition = "gitdir:~/dev/epita/";
        contents = {
          user = {
            email = "ethan.zouzoulkowsky@epita.fr";
            signingKey = "7B8DDB5C8EC4F388";
          };
          extraConfig = {
            init = {
              defaultBranch = "master";
            };
          };
        };
      }
    ];
  };
}
