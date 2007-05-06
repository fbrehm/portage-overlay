#!/bin/sh

if [ $1 == start ] || [ $1 == install ] ; then
	#echo "Creating symlinks..."
	cd $VHOST_ROOT
	rm -rf typo3_src
	ln -s typo3_src-3.8.1 typo3_src
	cd $VHOST_ROOT/typo3_src
	ln -s typo3/sysext/cms/tslib tslib
	cd $VHOST_ROOT/typo3_src/t3lib/fonts
	ln -s nimbus.ttf arial.ttf
	ln -s vera.ttf verdana.ttf
	cd $VHOST_ROOT/typo3_src/typo3
	ln -s ../t3lib t3lib
	ln -s ../t3lib/gfx gfx
	ln -s ../t3lib/thumbs.php thumbs.php
	chown $VHOST_CONFIG_UID:$VHOST_CONFIG_GID $VHOST_ROOT/typo3_src/typo3/temp $VHOST_ROOT/typo3_src/typo3/ext
fi

if [ $1 == stop ] || [ $1 == clean ] ; then
	#echo "Removing symlinks.."
	cd $VHOST_ROOT/typo3_src/
	rm t3lib/fonts/arial.ttf t3lib/fonts/verdana.ttf tslib typo3/gfx typo3/t3lib typo3/thumbs.php
	cd $VHOST_ROOT
	rm typo3_src
fi
