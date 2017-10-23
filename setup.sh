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

