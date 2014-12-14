# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_2,3_3,3_4} pypy2_0 )

DESCRIPTION="Additional Nagios plugins for usage by ProfitBricks."
HOMEPAGE="https://github.com/fbrehm/nagios-plugin"
SRC_URI=""
EGIT_REPO_URI="https://github.com/fbrehm/nagios-plugin.git"

inherit git-2 distutils-r1 user versionator

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="megaraid nrpe perl smart"

EGIT_BRANCH="master"
EGIT_COMMIT="$(replace_version_separator 3 '-')_deb6"

RDEPEND="
	~dev-python/nagios-plugin-${PV}
	nrpe? ( || (
		net-analyzer/nrpe
		virtual/nrpe
	) )
	perl? ( dev-perl/Nagios-Plugin )
	smart? ( sys-apps/smartmontools )
	megaraid? ( sys-block/megacli )
"
DEPEND="
	${RDEPEND}
"

REQUIRED_USE="megaraid? ( smart )"

pkg_setup() {
	elog "Used GIT tag: '${EGIT_COMMIT}'."

    einfo "Start setup package ..."
	distutils-r1_src_prepare
}

src_compile() {
    einfo "Start compiling package ..."
    distutils-r1_src_compile
}

src_install() {
    einfo "Start installing package ..."

	dodir /usr/lib64
	dosym lib64 /usr/lib
	dodir /usr/lib64/nagios/plugins/pb

	distutils-r1_src_install

	use smart || rm ${D}/usr/bin/check_smart_state

	rm -fv ${ED}/usr/lib*/python*/site-packages/*.egg-info
	rm -fv ${ED}/usr/lib*/python*/site-packages/nagios/*.py*
	rm -fvr ${ED}/usr/lib*/python*/site-packages/nagios/plugin
	rm -fvr ${ED}/usr/lib*/python*/site-packages/nagios/__pycache__

	einfo "Installing debian/changelog and README.txt"
	dodoc debian/changelog
	dodoc README.txt

	for script in clean-reboot-flag check_procs check_smart_state check_uname check_vg_free check_vg_state ; do
		src="${ED}/usr/lib/nagios/plugins/pb/${script}"
		link_tgt="../lib/nagios/plugins/pb/${script}"
		link="/usr/bin/${script}"
		if [ -f "${src}" ] ; then
			einfo "Creating symlink ${link} -> ${link_tgt}"
			dosym "${link_tgt}" "${link}"
		fi
	done

}

# vim: filetype=ebuild ts=4 sw=4
