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
resetConfig $(pwd)/bash/_Xdefaults ~/.Xdefaults
resetConfig $(pwd)/bash/_bash_logout ~/.bash_logout
resetConfig $(pwd)/bash/_bash_profile ~/.bash_profile
resetConfig $(pwd)/bash/_bashrc ~/.bashrc
resetConfig $(pwd)/bash/_dialogrc ~/.dialogrc
resetConfig $(pwd)/bash/_fehbg ~/.fehbg
resetConfig $(pwd)/bash/_gitconfig ~/.gitconfig
resetConfig $(pwd)/bash/_gtkrc-2.0 ~/.gtkrc-2.0
resetConfig $(pwd)/bash/_inputrc ~/.inputrc
resetConfig $(pwd)/bash/_wallpaper.jpg ~/.wallpaper.jpg
resetConfig $(pwd)/bash/_wallpaper2.jpg ~/.wallpaper2.jpg
resetConfig $(pwd)/bash/_xinitrc ~/.xinitrc

# elinks
resetConfig $(pwd)/elinks/_bookmarks.html ~/.bookmarks.html
resetConfig $(pwd)/elinks/_elinks/elinks.conf ~/.elinks/elinks.conf
resetConfig $(pwd)/elinks/_elinks/newsbeuter.conf ~/.elinks/newsbeuter.conf

# firefox
resetConfig $(pwd)/firefox/default/searchplugins ~/.mozilla/firefox/default/searchplugins
resetConfig $(pwd)/firefox/default/prefs.js ~/.mozilla/firefox/default/prefs.js
resetConfig $(pwd)/firefox/plain/searchplugins ~/.mozilla/firefox/plain/searchplugins
resetConfig $(pwd)/firefox/plain/prefs.js ~/.mozilla/firefox/plain/prefs.js
resetConfig $(pwd)/firefox/stream/searchplugins ~/.mozilla/firefox/stream/searchplugins
resetConfig $(pwd)/firefox/stream/prefs.js ~/.mozilla/firefox/stream/prefs.js
resetConfig $(pwd)/firefox/profiles.ini ~/.mozilla/firefox/profiles.ini

# herbsluftwm
resetConfig $(pwd)/herbsluftwm/_herbsluftwm/autostart ~/.herbsluftwm/autostart

# mplayer
resetConfig $(pwd)/mplayer/_mplayer/config ~/.mplayer/config
resetConfig $(pwd)/mplayer/_mplayer/input.conf ~/.mplayer/input.conf

# mpv
resetConfig $(pwd)/mpv/_mpv/config ~/.mpv/config
resetConfig $(pwd)/mpv/_mpv/input.conf ~/.mpv/input.conf

# mutt
resetConfig $(pwd)/mutt/_mailcap ~/.mailcap
resetConfig $(pwd)/mutt/_muttrc ~/.muttrc
resetConfig $(pwd)/mutt/_procmailrc ~/.procmailrc
resetConfig $(pwd)/mutt/_urlview ~/.urlview

# newsbeuter
resetConfig $(pwd)/newsbeuter/_newsbeuter/config ~/.newsbeuter/config
resetConfig $(pwd)/newsbeuter/_newsbeuter/urls ~/.newsbeuter/urls

# pentadactyl
resetConfig $(pwd)/pentadactyl/_pentadactylrc ~/.pentadactylrc

# rtorrent
resetConfig $(pwd)/rtorrent/_rtorrent.rc ~/.rtorrent.rc

# screen
resetConfig $(pwd)/screen/_screenrc ~/.screenrc

# vifm
resetConfig $(pwd)/vifm/_vifm/colors ~/.vifm/colors
resetConfig $(pwd)/vifm/_vifm/vifmrc ~/.vifm/vifmrc

# vim
resetConfig $(pwd)/vim/_vimrc ~/.vimrc
resetConfig $(pwd)/vim/_vim/doc ~/.vim/doc
resetConfig $(pwd)/vim/_vim/plugin ~/.vim/plugin

# xzgv
resetConfig $(pwd)/xzgv/_xzgvrc ~/.xzgvrc

# zathura
resetConfig $(pwd)/zathura/zathurarc ~/.config/zathura/zathurarc

