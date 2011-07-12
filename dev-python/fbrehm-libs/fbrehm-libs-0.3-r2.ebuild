# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=3
PYTHON_DEPEND="2:2.5"
SUPPORT_PYTHON_ABIS="1"


RESTRICT="nomirror"

inherit distutils subversion

ESVN_REPO_URI="http://svn.brehm-online.com/svn/my-stuff/python/fbrehm/tags/${PV}"
ESVN_PROJECT="python-${PN}"

PYTHON_MODNAME="fbrehm/__init__.py fbrehm/common/__init__.py fbrehm/common/getopt.py fbrehm/common/logging_obj.py"

DESCRIPTION="A collection of common python modules by Frank Brehm"
HOMEPAGE="http://svn.brehm-online.com/svn/my-stuff/python/fbrehm/"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

DOCS="README.txt debian/changelog"

