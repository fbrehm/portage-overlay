# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3,3_4} pypy2_0 )

DESCRIPTION="Python interface for ImageMagick library"
HOMEPAGE="http://docs.wand-py.org/"
SRC_URI=""
EGIT_REPO_URI="git://github.com/dahlia/wand.git"

inherit git-2 distutils-r1

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc"

EGIT_BRANCH="master"
EGIT_COMMIT=${PV}

DOCS="CONTRIBUTING.rst LICENSE MANIFEST.in README.rst"

RDEPEND="
	${PYTHON_DEPS}
	>=media-gfx/imagemagick-6.4
"
DEPEND="
	${RDEPEND}
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
"

pkg_setup() {

	einfo "Used GIT tag: '${EGIT_COMMIT}'."
	einfo "Start setup package ..."
	distutils-r1_src_prepare
}

src_compile() {
	einfo "Start compiling package ..."
	distutils-r1_src_compile
	if use doc; then
		sphinx-build docs html || die
	fi
}

src_install() {
	einfo "Start installing package ..."
	distutils-r1_src_install
	rm -f -v ${ED}usr/README.rst
	rm -f -v ${D}usr/README.rst
}

python_install_all() {
	einfo "Start installing complete package ..."
	use doc && local HTML_DOCS=( html/. )
	distutils-r1_python_install_all
}

# vim: filetype=ebuild ts=4 sw=4
