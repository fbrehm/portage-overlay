# Copyright 1999-2004 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2

inherit eutils
inherit webapp

MY_P=${PN/typo3_/}-${PV}

DESCRIPTION="TYPO3 is a free Open Source content management system for enterprise purposes on the web and in intranets."
HOMEPAGE="http://www.typo3.com/  http://typo3.org/"
SRC_URI="mirror://sourceforge/typo3/${MY_P}.tar.gz"
RESTRICT="nomirror nostrip"
LICENSE="GPL"
KEYWORDS="x86 ppc sparc"
DEPEND="net-www/typo3_src"

S=${WORKDIR}/${MY_P}

src_install() {
	webapp_src_preinst

	local docs="INSTALL.txt Package.txt README.txt TODO.txt"
	cd ${WORKDIR}/${MY_P}
	einfo "Installing main files"
	mkdir -p ${D}/${MY_HTDOCSDIR}
	mkdir -p ${D}/${MY_HOOKSCRIPTSDIR}
	cp -r . ${D}/${MY_HTDOCSDIR}
	mkdir -p ${D}/${MY_HTDOCSDIR}/typo3temp ${D}/${MY_HTDOCSDIR}/fileadmin/_temp_/
	touch ${D}/${MY_HTDOCSDIR}/typo3temp/.keep ${D}/${MY_HTDOCSDIR}/fileadmin/_temp_/.keep ${D}/${MY_HTDOCSDIR}/typo3conf/ext/.keep ${D}/${MY_HTDOCSDIR}/uploads/pics/.keep ${D}/${MY_HTDOCSDIR}/uploads/media/.keep ${D}/${MY_HTDOCSDIR}/uploads/tf/.keep
	webapp_configfile ${MY_HTDOCSDIR}/typo3conf/localconf.php
	
	webapp_src_install
	webapp_hook_script ${FILESDIR}/typo3_genarate_symlinks.sh
}

pkg_postinst() {
	einfo "  *** NOTE typo3_quickstart ***"
	einfo "Edit: /etc/vhosts/webapp-config"
	einfo "    VHOST_CONFIG_UID=\"apache\""
	einfo "    VHOST_CONFIG_GID=\"apache\""
	einfo "Install this package with webapp-config!"
	einfo "For example:"
	einfo "webapp-config -I typo3_quickstart ${PV} --virtual-dirs server-owned --virtual-files server-owned -d <directory>"
	einfo "After starting the MySQL and Webserver try http://<host>/<directory>"
	einfo "and follow the 1-2-3-Install-Tool to finish your setup!"
	einfo "Backend login with: admin/password"
	einfo ""
	einfo "                                                Have a nice day!"
}	   
