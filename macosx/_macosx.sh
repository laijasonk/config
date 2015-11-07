#!/bin/bash
# Script to reset the config files in the home directory. Checks if the file
# exists and removes it before creating symbolic links from the current
# directory to the appropriate path.

resetConfig() {
	remote="$1"
	local="$2"

	echo "    resetting $remote to $local"

	if [ -f $local ]
	then
		echo "        removed $local"
		rm $local
	fi
	if [ -d $local ] 
	then
		echo "        removed $local"
		rm -R $local
	fi

	if [ ! -d $(dirname $local) ]
	then
		echo "        made directory $local"
		mkdir -p $(dirname $local)
	fi

	ln -s $remote $local
}

read -p "WARNING: Completely resets config for home directory [CTRL-C to quit] "

resetConfig $(pwd)/bash/_Xmodmap ~/.Xmodmap
resetConfig $(pwd)/bash/_amethyst ~/.amethyst
resetConfig $(pwd)/bash/_bash_logout ~/.bash_logout
resetConfig $(pwd)/bash/_bash_profile ~/.bash_profile
resetConfig $(pwd)/bash/_bashrc ~/.bashrc
resetConfig $(pwd)/bash/_dir_colors ~/.dir_colors
resetConfig $(pwd)/bash/_gitconfig ~/.gitconfig
resetConfig $(pwd)/bash/_inputrc ~/.inputrc

resetConfig $(pwd)/elinks/_elinks/elinks.conf ~/.elinks/elinks.conf
resetConfig $(pwd)/elinks/_elinks/newsbeuter.conf ~/.elinks/newsbeuter.conf

resetConfig $(pwd)/firefox/default/searchplugins ~/library/Application*Support/Firefox/Profiles/default/searchplugins
resetConfig $(pwd)/firefox/default/pref.js ~/library/Application*Support/Firefox/Profiles/default/pref.js
resetConfig $(pwd)/firefox/profiles.ini ~/library/Application*Support/Firefox/profiles.ini

resetConfig $(pwd)/newsbeuter/_newsbeuter/config ~/.newsbeuter/config
resetConfig $(pwd)/newsbeuter/_newsbeuter/urls ~/.newsbeuter/urls

resetConfig $(pwd)/pentadactyl/_pentadactylrc ~/.pentadactylrc

resetConfig $(pwd)/screen/_screenrc ~/.screenrc

resetConfig $(pwd)/vifm/_vifm/colors ~/.vifm/colors
resetConfig $(pwd)/vifm/_vifm/vifmrc ~/.vifm/vifmrc

resetConfig $(pwd)/vim/_vimrc ~/.vimrc
resetConfig $(pwd)/vim/_vim ~/.vim
