#!/bin/bash

if grep --quiet ". ~/rc/bash/main" ~/.bashrc; then
	echo "bash previously ok"
else
	if [ -f ~/.bashrc ]; then
		if [ ! -f ~/.bashrc.orig ]; then
			mv ~/.bashrc ~/.bashrc.orig
		fi
		echo ". ~/.bashrc.orig" >> ~/.bashrc
	fi
	echo ". ~/rc/bash/main" >> ~/.bashrc
	echo "bash ok"
fi

if grep --quiet "~/rc/git/main" ~/.gitconfig; then
	echo "git previously ok"
else
	if [ -f ~/.gitconfig ]; then
		if [ ! -f ~/.gitconfig.orig ]; then
			mv ~/.gitconfig ~/.gitconfig.orig
		fi
		echo "[include]" >> ~/.gitconfig
		echo "    path = ~/rc/git/main" >> ~/.gitconfig
		echo "[include]" >> ~/.gitconfig
		echo "    path = ~/.gitconfig.orig" >> ~/.gitconfig
	else
		echo "[include]" >> ~/.gitconfig
		echo "    path = ~/rc/git/main" >> ~/.gitconfig
	fi
	echo "git ok"
fi

if grep --quiet "so ~/rc/vim/main" ~/.vimrc; then
	echo "vim previously ok"
else
	if [ -f ~/.vimrc ]; then
		if [ ! -f ~/.vimrc.orig ]; then
			mv ~/.vimrc ~/.vimrc.orig
		fi
		echo "so ~/.vimrc.orig" >> ~/.vimrc
	fi
	echo "so ~/rc/vim/main" >> ~/.vimrc
	(
		cd ~/rc
		git submodule update --init
	)
	echo "vim ok"
fi

if grep --quiet "source-file ~/rc/tmux/main" ~/.tmux.conf; then
	echo "tmux previously ok"
else
	if [ -f ~/.tmux.conf ]; then
		if [ ! -f ~/.tmux.conf.orig ]; then
			mv ~/.tmux.conf ~/.tmux.conf.orig
		fi
		echo "source-file ~/.tmux.conf.orig" >> ~/.tmux.conf
	fi
	echo "source-file ~/rc/tmux/main" >> ~/.tmux.conf
	echo "tmux ok"
fi
