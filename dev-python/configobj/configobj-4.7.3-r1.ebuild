# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3,3_4} pypy2_0 )

DESCRIPTION="Simple config file reader and writer"
HOMEPAGE="http://www.voidspace.org.uk/python/configobj.html http://code.google.com/p/configobj/ http://pypi.python.org/pypi/configobj"
SRC_URI=""
EGIT_REPO_URI="https://github.com/fbrehm/configobj.git"

inherit git-2 distutils-r1 eutils

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~ia64 ~ppc ~ppc64 ~sparc x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE="doc"

EGIT_BRANCH="develop"
#EGIT_COMMIT=$(replace_version_separator 3 '-')
EGIT_COMMIT=${V}

DEPEND="app-arch/unzip"
RDEPEND=""

#PATCHES=( "${FILESDIR}"/${P}-fix_tests.patch )

python_prepare_all() {
	distutils-r1_python_prepare_all
	sed -e "s/ \(doctest\.testmod(.*\)/ sys.exit(\1[0] != 0)/" -i validate.py || die
}

python_test() {
	"${PYTHON}" validate.py -v || die
}

python_install_all() {
	distutils-r1_python_install_all
	if use doc; then
		rm -f docs/BSD*
		insinto /usr/share/doc/${PF}/html
		doins -r docs/* || die "doins failed"
	fi
}
