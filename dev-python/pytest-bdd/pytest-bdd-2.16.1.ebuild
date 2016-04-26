# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 python3_{3,4,5} pypy pypy3 )

inherit distutils-r1

DESCRIPTION="BDD library for the py.test runner"
HOMEPAGE="https://pypi.python.org/pypi/pytest-bdd"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="test"

RDEPEND=""
DEPEND="${RDEPEND}
    dev-python/setuptools[${PYTHON_USEDEP}]
    test? ( dev-python/pytest[${PYTHON_USEDEP}] )
    "

# https://bitbucket.org/hpk42/pytest-cache/issues/12
RESTRICT=test

python_test() {
    PYTEST_PLUGINS="pytest_bdd" py.test -v -v || die
}

