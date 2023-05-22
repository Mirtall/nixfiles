{ config, pkgs, ... }: {
  home.file.".vim/coc-settings.json".text = ''
    {
      "clangd.path": "${pkgs.clang-tools}/bin/clangd",

      "languageserver": {
        "nix": {
            "command": "rnix-lsp",
            "filetypes": ["nix"]
          },

        "ocaml": {
            "command": "ocaml-language-server",
            "args": ["--stdio"],
            "filetypes": ["ocaml", "reason"]
          }
        }
      }
  '';
}
