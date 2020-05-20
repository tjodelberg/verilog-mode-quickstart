# verilog-mode-quickstart

All the configuration files to setup verilog-mode for vim with an example testbench.

What you need to run verilog-mode for vim. 
  1. Vim plugin manager. I use Vundle. (Optional but helpful)
  2. Emacs
  3. Verilog-mode plugin for Emacs.
  4. Verilog-mode plugin for Vim.

All of this is already configured for you in .vimrc_example and the elisp folder included in this repo.

Quick start:

  1. Copy or rename the .vimrc_example. This file has the configuration for Vundle and the plugin for vim-verilog-mode. Either rename this file as .vimrc if you do not have one, or copy and paste the contents into your own .vimrc. Make sure it is in your home directory.
  2. Open your .vimrc and type :PluginInstall. This is the Vundle command to install the plugins. Save and quit.
  3. The elisp directory contains the verilog-mode plugin for emacs already decompressed. Make sure this is in your home directory.
  4. Look at the README in the verilog_examples for how to run an example.

How does it work?
Vim does not have a "verilog-mode", but we can hack it to use the emacs "verilog-mode" commands in the background. You do not need to know how to use emacs for this to work. Only the autogeneration is ported from emacs to vim, not all verilog-mode features.









