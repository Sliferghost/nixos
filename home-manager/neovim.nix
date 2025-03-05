{ pkgs, lib, ... }:
{
  home.packages = [
    pkgs.nixfmt-rfc-style
  ];

  programs.nixvim = {
    enable = true;

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    opts = {
      number = true;
      relativenumber = true;

      mouse = "a";

      showmode = false;

      breakindent = true;

      undofile = true;

      ignorecase = true;
      smartcase = true;

      signcolumn = "yes";

      updatetime = 250;

      timeoutlen = 300;

      splitright = true;
      splitbelow = true;

      list = false;
      listchars = {
        tab = "» ";
        trail = "·";
        nbsp = "␣";
      };

      inccommand = "split";

      cursorline = true;

      scrolloff = 10;

      smarttab = true;
      autoindent = true;
      tabstop = 4;
      softtabstop = 0;
      shiftwidth = 0;
      expandtab = false;

      clipboard = {
        providers = {
          wl-copy.enable = true;
        };
        register = "unnamedplus";
      };
    };

    autoGroups = {
      highlight_yank = { };
    };

    autoCmd = [
      {
        desc = "Highlight when yanking text";
        group = "highlight_yank";
        event = [ "TextYankPost" ];
        pattern = "*";
        callback = {
          __raw = ''
            		  function()
            		    vim.highlight.on_yank()
            		  end
            		  '';
        };
      }
    ];

    colorschemes.catppuccin = {
      enable = true;
      settings = {
        style = "mocha";
      };
    };

    plugins = {
      sleuth.enable = true;

      gitsigns = {
        enable = true;
        settings = {
          signs = {
            add.text = "+";
            change.text = "~";
            delete.text = "_";
            topdelete.text = "‾";
            changedelete.text = "~";
            untracked.text = "┆";
          };
        };
      };

      conform-nvim = {
        enable = true;
        settings = {
          formatters_by_ft = {
            nix = [
              "nixfmt"
            ];
          };
          format_on_save = {
            timeout_ms = 200;
            lsp_fallback = false;
          };
          formatters = {
            nixfmt = {
              command = lib.getExe pkgs.nixfmt-rfc-style;
            };
          };
        };
      };
    };
  };
}
