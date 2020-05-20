# verilog-mode-quickstart

All the configuration files to setup verilog-mode for vim with an example testbench. 

**What you need to run verilog-mode for vim.**
  1. Vim plugin manager. I use Vundle. (Optional but helpful)
  2. Emacs
  3. Verilog-mode plugin for Emacs.
  4. Verilog-mode plugin for Vim.

All of this is already configured in the `.vimrc_example` and the `elisp` folder included in this repo.

**Quick start:**
  1. Get Vundle by running this command: `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
  2. Clone this repo into any new directory: `git clone https://github.com/tjodelberg/verilog-mode-quickstart ~/verilog-mode-quickstart`
  3. Copy or rename `.vimrc_example` and move into your home directory. Either copy this this file `cp .vimrc_example ~/.vimrc` if you do not have one, or  paste the contents into your own `~/.vimrc` if you have one.
  4. Open your `.vimrc` in vim and type `:PluginInstall`. This is the Vundle command to install the plugins. `:q` to exit Vundle then `:wq` to save and quit.
  5. Copy the `elisp` directory into your home directory: `cp -r elisp ~/`. This contains the emacs verilog-mode plugin.
  6. Look at the `README` in the verilog_examples for how to run an example.

**How does it work?**

Vim does not have a "verilog-mode", but we can hack it to use the emacs "verilog-mode" commands in the background. You do not need to know emacs for this to work. Only the autogeneration is ported from emacs to vim, not all verilog-mode features.

**Helpful Links**

Vundle: https://github.com/VundleVim/Vundle.vim

Verilog-Mode-Vim-Plugin: https://www.vim.org/scripts/script.php?script_id=1875

Verilog-Mode-Emacs-Features: https://www.veripool.org/wiki/verilog-mode












