# Copyright 1999-2004 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2


inherit eutils webapp

MY_P=${PN}-${PV/_/}

DESCRIPTION="TYPO3 is a free Open Source content management system for enterprise purposes on the web and in intranets."
HOMEPAGE="http://www.typo3.com/  http://typo3.org/"
#SRC_URI="http://typo3.sunsite.dk/unix-archives/${PV}/typo3_src/${MY_P}.tar.gz"
SRC_URI="mirror://sourceforge/typo3/${MY_P}.tar.gz"
RESTRICT="nomirror nostrip"
LICENSE="GPL"
KEYWORDS="x86 ppc sparc"
RDEPEND="app-admin/webapp-config 
		~media-libs/freetype-1.3.1-r3
		media-libs/jpeg
		sys-libs/zlib
		media-libs/tiff
		media-libs/libpng
		media-libs/gd
		sys-devel/gettext
		media-libs/ming
		media-libs/pdflib
		dev-db/mysql
		net-www/apache
		dev-lang/php"

		# media-gfx/graphicsmagick

S=${WORKDIR}/${MY_P}


src_install() {
	webapp_src_preinst
	local docs="TODO.txt GPL.txt ChangeLog LICENSE.txt Package.txt README.txt" 
	cd ${WORKDIR}
	cd ${WORKDIR}/${MY_P}/typo3/install/
	sed -i -e 's:die:#die:g' index.php || die "sed command failed!"	
	cd ${WORKDIR}

	einfo "Installing main files"
	mkdir -p ${D}${MY_HOSTROOTDIR}/${MY_P}/typo3/temp
	touch ${D}${MY_HOSTROOTDIR}/${MY_P}/typo3/temp/.keep
	mkdir -p ${D}${MY_HOSTROOTDIR}/
	mkdir -p ${D}${MY_HOOKSCRIPTSDIR}
	cp -r . ${D}${MY_HOSTROOTDIR}
	cd  ${WORKDIR}/${MY_P}
	
	webapp_src_install
	webapp_hook_script ${FILESDIR}/typo3_genarate_symlinks_3.8.1.sh
}

pkg_postinst(){
	einfo "  *** NOTE gd ***"
	einfo "gd needs to be compiled with USE=\"gif\""
	einfo "If you don't have \"gif\" in your USE gd needs a recompile."
	einfo ""
	einfo "  *** NOTE mod_php ***"
	einfo "If your mod_php was compiled before gd it needs to be recompiled."
	einfo "You also need to set \"gd-external\" in your USE variable."
	einfo ""
	einfo "  *** NOTE Typo3 ***"
	einfo "You also need to emerge typo3_dummy, typo3_testsite or"
	einfo "typo3_quickstart!"
	einfo "Setup will now be done with webapp-config!"
	einfo ""
	einfo "                                                Have a nice day!"
}
