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

