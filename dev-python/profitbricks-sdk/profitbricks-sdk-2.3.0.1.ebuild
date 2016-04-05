# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python{2_7,3_2,3_3,3_4,3_5} pypy2_0 )

DESCRIPTION="ProfitBricks REST API client library for Python"
HOMEPAGE="https://github.com/profitbricks/profitbricks-sdk-python"
SRC_URI=""
EGIT_REPO_URI="https://github.com/fbrehm/profitbricks-sdk-python.git"

inherit git-2 distutils-r1 versionator

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

EGIT_BRANCH="master"
EGIT_COMMIT="$(replace_version_separator 4 '-')"

DOCS="LICENSE README.md requirements.txt"

RDEPEND="
	dev-python/six
	>=dev-python/requests-2.8.0
"
DEPEND="${RDEPEND}"

src_prepare() {
	elog "Used GIT tag: '${EGIT_COMMIT}'."
	distutils-r1_src_prepare
}


# vim: filetype=ebuild ts=4 sw=4
