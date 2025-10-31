{ pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "Ethan Zouzoulkowsky";
    userEmail = "ethan.zouzoulkowsky@gmail.com";

    ignores = [
      "*.swp" # vim temp files
      "*~" # emacs temp files
      ".idea/" # JetBrains IDE folders
      "result" # nix derivation result
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
        key = "4A63CA99E29B2A22";
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
          };
          init = {
            defaultBranch = "master";
          };
        };
      }

      {
        condition = "gitdir:~/dev/epita";
        contents = {
          user = {
            email = "ethan@therya.com";
            signingKey = "016BCDD8724E5372";
          };
        };
      }
    ];
  };
}
