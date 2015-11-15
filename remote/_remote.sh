#!/bin/bash
# Script to reset the config files in the home directory. Checks if the file
# exists and removes it before creating symbolic links from the current
# directory to the appropriate path.

resetConfig() {
	# handle input arguments
	config="$1"
	link="$2"
	dirname=$(dirname -- "$link")

	echo "    resetting $config to $link"

	# remove file if it exists
	if [ -f "$link" ] || [ -d "$link" ]
	then
		rm -Rf -- "$link"
	fi

	# make the preceding directory if it does not exist
	if [ ! -d "$dirname" ]
	then
		mkdir -p -- "$dirname"
	fi

	# link the remote config to the local link
	ln -s "$config" "$link"
}

read -p "WARNING: Completely resets config for home directory [CTRL-C to quit] "

# bash
resetConfig $(pwd)/bash/_bash_logout ~/.bash_logout
resetConfig $(pwd)/bash/_bash_profile ~/.bash_profile
resetConfig $(pwd)/bash/_bashrc ~/.bashrc
resetConfig $(pwd)/bash/_dir_colors ~/.dir_colors
resetConfig $(pwd)/bash/_inputrc ~/.inputrc

## elinks
#resetConfig $(pwd)/elinks/_bookmarks.html ~/.bookmarks.html
#resetConfig $(pwd)/elinks/_elinks/elinks.conf ~/.elinks/elinks.conf
#resetConfig $(pwd)/elinks/_elinks/newsbeuter.conf ~/.elinks/newsbeuter.conf

# screen
resetConfig $(pwd)/screen/_screenrc ~/.screenrc

# vifm
resetConfig $(pwd)/vifm/_vifm/colors ~/.vifm/colors
resetConfig $(pwd)/vifm/_vifm/vifmrc ~/.vifm/vifmrc

# vim
resetConfig $(pwd)/vim/_vimrc ~/.vimrc
resetConfig $(pwd)/vim/_vim/autoload ~/.vim/autoload
resetConfig $(pwd)/vim/_vim/bitmaps ~/.vim/bitmaps
resetConfig $(pwd)/vim/_vim/colors ~/.vim/colors
resetConfig $(pwd)/vim/_vim/doc ~/.vim/doc

