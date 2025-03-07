{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    nixfmt-rfc-style
    statix
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

      clipboard = "unnamedplus";
    };

    keymaps = [
      {
        mode = [ "n" ];
        key = "<Esc>";
        action = "<cmd>nohlsearch<CR>";
        options = {
          desc = "Clear highlighting on search";
        };
      }
      {
        mode = [ "n" ];
        key = "<leader>e";
        action = {
          __raw = ''
            function()
              MiniFiles.open()
            end
          '';
        };
        options = {
          desc = "Open [E]xplorer";
        };
      }
      {
        mode = [ "n" ];
        key = "<leader>/";
        action = {
          __raw = ''
            function()
              require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 10,
                previewer = false,
              })
            end
          '';
        };
        options = {
          desc = "[/] Fuzzily search in current buffer";
        };
      }
      {
        mode = [ "n" ];
        key = "<leader>s/";
        action = {
          __raw = ''
            function()
              require('telescope.builtin').live_grep {
                grep_open_files = true,
                prompt_title = 'Live Grep in Open Files',
              }
            end
          '';
        };
        options = {
          desc = "[S]earch [/] in Open Files";
        };
      }
      {
        mode = [ "n" ];
        key = "<leader>lg";
        action = "<cmd>LazyGit<CR>";
        options = {
          desc = "[L]azy[G]it";
        };
      }
    ];

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

      friendly-snippets = {
        enable = true;
      };

      luasnip = {
        enable = true;
      };

      cmp = {
        enable = true;
        autoEnableSources = true;

        settings = {
          snippet = {
            expand = ''
              function(args)
                require('luasnip').lsp_expand(args.body)
              end
            '';
          };

          sources = [
            { name = "nvim_lsp"; }
            { name = "luasnip"; }
            { name = "path"; }
            { name = "buffer"; }
          ];

          mapping = {
            "<C-n>" = "cmp.mapping.select_next_item()";
            "<C-p>" = "cmp.mapping.select_prev_item()";

            "<C-b>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";

            "<C-y>" = "cmp.mapping.confirm { select = true }";

            "<C-Space>" = "cmp.mapping.complete {}";
          };

          completion.completeopt = "menu,menuone,noinsert";
        };
      };

      todo-comments = {
        enable = true;

        settings = {
          signs = false;
        };
      };

      treesitter = {
        enable = true;

        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          bash
          markdown
          markdown_inline
          nix
        ];

        settings = {
          highlight = {
            enable = true;
          };

          indent = {
            enable = true;
          };
        };
      };

      telescope = {
        enable = true;

        extensions = {
          fzf-native.enable = true;
        };

        keymaps = {
          "<leader>sh" = {
            action = "help_tags";
            options.desc = "[S]earch [H]elp";
          };
          "<leader>sk" = {
            action = "keymaps";
            options.desc = "[S]earch [K]eymaps";
          };
          "<leader>sf" = {
            action = "find_files";
            options.desc = "[S]earch [F]iles";
          };
          "<leader>ss" = {
            action = "builtin";
            options.desc = "[S]earch [S]elect Telescope";
          };
          "<leader>sw" = {
            action = "grep_string";
            options.desc = "[S]earch current [W]ord";
          };
          "<leader>sg" = {
            action = "live_grep";
            options.desc = "[S]earch by [G]rep";
          };
          "<leader>sd" = {
            action = "diagnostics";
            options.desc = "[S]earch [D]iagnostics";
          };
          "<leader>sr" = {
            action = "resume";
            options.desc = "[S]earch [R]esume";
          };
          "<leader>s." = {
            action = "oldfiles";
            options.desc = "[S]earch Recent Files ('.' for repeat)";
          };
          "<leader><leader>" = {
            action = "buffers";
            options.desc = "[ ] Find existing buffers";
          };
        };
      };

      web-devicons = {
        enable = true;
      };

      mini = {
        enable = true;
        modules = {
          icons = { };
          ai = {
            n_lines = 500;
          };
          surround = { };
          files = { };
          pairs = { };
          statusline = {
            use_icons = true;
            section_location = {
              __raw = ''
                function()
                  return '%2l:%-2v'
                end
              '';
            };
          };
        };
      };

      lint = {
        enable = true;

        lintersByFt = {
          nix = [ "statix" ];
        };
      };

      lazygit = {
        enable = true;
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

      which-key = {
        enable = true;
        settings = {
          spec = [
            {
              mode = [
                "n"
                "x"
              ];
              __unkeyed-1 = "<leader>c";
              group = "[C]ode";
            }
            {
              __unkeyed-1 = "<leader>d";
              group = "[D]ocument";
            }
            {
              __unkeyed-1 = "<leader>r";
              group = "[R]ename";
            }
            {
              __unkeyed-1 = "<leader>s";
              group = "[S]earch";
            }
            {
              __unkeyed-1 = "<leader>w";
              group = "[W]orkspace";
            }
            {
              __unkeyed-1 = "<leader>t";
              group = "[T]oggle";
            }
            {
              mode = [
                "n"
                "v"
              ];
              __unkeyed-1 = "<leader>h";
              group = "Git [H]unk";
            }
          ];
        };
      };

    };
  };
}
