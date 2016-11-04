# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7,3_3,3_4,3_5} pypy2_0 )

DESCRIPTION="A specs-conforming and strict parser and writer for TOML files"
HOMEPAGE="https://github.com/avakar/pytoml"
SRC_URI="https://github.com/avakar/pytoml/archive/v${PV}.tar.gz"

inherit distutils-r1

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DOCS="LICENSE README.md"

RDEPEND="
	${PYTHON_DEPS}
"
DEPEND="
	${RDEPEND}
"

pkg_setup() {
	einfo "Start setup package ..."
	distutils-r1_src_prepare
}

src_compile() {
	einfo "Start compiling package ..."
	distutils-r1_src_compile
}

src_install() {
	einfo "Start installing package ..."
	distutils-r1_src_install
}

python_install_all() {
	einfo "Start installing complete package ..."
	distutils-r1_python_install_all
}

# vim: filetype=ebuild ts=4 sw=4
