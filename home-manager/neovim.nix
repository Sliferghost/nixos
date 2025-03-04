{ pkgs, ... }: {
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

    colorschemes.catppuccin = {
      enable = true;
      settings = {
        style = "mocha";
      };
    };
  };
}
