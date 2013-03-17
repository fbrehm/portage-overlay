# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=3
PYTHON_DEPEND="2:2.6"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

RESTRICT="nomirror"

inherit distutils

DESCRIPTION="A powerful remote execution manager that can be used to administer servers in a fast and efficient way"
HOMEPAGE="http://saltstack.org/"
SRC_URI="http://github.com/downloads/saltstack/salt/salt-${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/pyyaml
		dev-python/m2crypto
        dev-python/msgpack
		dev-python/pycrypto
		dev-python/jinja
		dev-python/pyzmq
	"
RDEPEND="${DEPEND}"

DOCS="AUTHORS LICENSE PKG-INFO README.rst"

src_install() {

	distutils_src_install
	python_clean_installation_image

	# Writing /var/tmp/portage/app-admin/salt-0.9.7-r1/temp/images/2.7/usr/lib64/python2.7/site-packages/salt-0.9.7-py2.7.egg-info

	newinitd "${FILESDIR}/salt.master" salt.master || die
	newinitd "${FILESDIR}/salt.minion" salt.minion || die
	newconfd "${FILESDIR}/salt.confd" salt || die
}

