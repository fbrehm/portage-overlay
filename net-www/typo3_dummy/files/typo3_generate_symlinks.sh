#!/bin/sh

if [ $1 == start ] || [ $1 == install ] ; then
	#echo "Creating symlinks..."
	cd $MY_INSTALLDIR
	ln -s $VHOST_ROOT/typo3_src/t3lib t3lib
	ln -s $VHOST_ROOT/typo3_src/tslib tslib
	ln -s $VHOST_ROOT/typo3_src/typo3 typo3
	ln -s $VHOST_ROOT/typo3_src/tslib/showpic.php showpic.php
	ln -s tslib/media media
	ln -s tslib/index_ts.php index.php
	
	#echo "Setting up the permissions..."
	cd $MY_INSTALLDIR
	chown $VHOST_CONFIG_UID:$VHOST_CONFIG_GID typo3temp typo3conf typo3conf/ext uploads uploads/pics uploads/media uploads/tf fileadmin fileadmin/_temp_
	
fi

if [ $1 == stop ] || [ $1 == clean ] ; then
	#echo "Removing symlinks..."
	cd $MY_INSTALLDIR
	rm index.php media showpic.php typo3 tslib t3lib
fi
