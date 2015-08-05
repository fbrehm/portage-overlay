# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="IPMI View GUI for Supermicro systems"
HOMEPAGE="https://github.com/fbrehm/ipmiview"
SRC_URI=""
EGIT_REPO_URI="https://github.com/fbrehm/ipmiview.git"

inherit git-2 versionator

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

EGIT_BRANCH="master"
EGIT_COMMIT="$(replace_version_separator 3 '-')+20150713-0pb1_deb6"

DEPEND="virtual/jre"
RDEPEND="${DEPEND}"

pkg_setup() {
	elog "Used GIT tag: '${EGIT_COMMIT}'."
}

src_install() {
	einfo "Start installing package ..."

	exeinto /usr/bin/
	newexe debian/ipmiview-bin ipmiview

	insinto /usr/share/java
	doins IPMIView20.jar

	insinto /usr/share/applications
	doins debian/ipmiview.desktop

	insinto /usr/share/icons/hicolor/48x48/apps/
	doins debian/ipmiview.png

	docompress -x /usr/share/doc
	dodoc ReleaseNote.txt IPMIView20.pdf

}
