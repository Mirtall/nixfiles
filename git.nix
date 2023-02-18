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
      };
    };

    includes = [
      {
        condition = "gitdir:~/dev/prologin/";
        contents = { user = { email = "ethan.zouzoulkowsky@prologin.org"; }; };
      }

      {
        condition = "gitdir:~/dev/epita/";
        contents = { user = { email = "ethan.zouzoulkowsky@epita.fr"; }; };
      }
    ];
  };
}
