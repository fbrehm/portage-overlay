# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="1"

inherit eutils

DESCRIPTION="Addon for the Nagios Network Monitoring System. PNP provides easy to use, easy to configure RRDTools based performance charts."
HOMEPAGE="http://www.pnp4nagios.org/start"
SRC_URI="http://switch.dl.sourceforge.net/sourceforge/pnp4nagios/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
RESTRICT="nomirror,strip"

DEPEND=">=net-analyzer/nagios-2
        dev-lang/perl
        >=net-analyzer/rrdtool-1.2
        >=dev-lang/php-4.3
"
RDEPEND="${DEPEND}"

src_compile() {
	econf \
		--prefix=/usr \
		--bindir=/usr/sbin \
		--sbindir=/usr/$(get_libdir)/nagios/cgi-bin \
		--datadir=/usr/share/nagios/htdocs \
		--localstatedir=/var/nagios \
		--sysconfdir=/etc/nagios/pnp \
		--libexecdir=/usr/$(get_libdir)/nagios/plugins \
		--htmldir=/usr/share/nagios/htdocs/pnp \
		--with-nagios-user=nagios \
		--with-nagios-group=nagios \
		--with-rrdtool=/usr/bin/rrdtool \
		--with-perfdata-dir=/var/nagios/perfdata \
		--with-perfdata-spool-dir=/var/nagios/spool/perfdata \
		|| die "econf failed"

	emake -j1 all || die "emake failed"
}


src_install() {

	dodoc AUTHORS BUGS ChangeLog COPYING INSTALL NEWS README README.npcd README.pnpsender THANKS TODO

	emake DESTDIR="${D}" HTMLDIR=/usr/share/nagios/htdocs/pnp install
	emake DESTDIR="${D}" HTMLDIR=/usr/share/nagios/htdocs/pnp install-config

	cat "${D}"/etc/nagios/pnp/npcd.cfg-sample | sed 's#^[ 	]*perfdata_file_run_cmd[ 	]*=.*#perfdata_file_run_cmd = /usr/lib/nagios/plugins/process_perfdata.pl#' >"${D}"/etc/nagios/pnp/npcd.cfg
	#cat "${D}"/etc/nagios/pnp/npcd.cfg-sample >"${D}"/etc/nagios/pnp/npcd.cfg
	rm "${D}"/etc/nagios/pnp/npcd.cfg-sample
	chown nagios:nagios "${D}"/etc/nagios/pnp/npcd.cfg
	chmod 664 "${D}"/etc/nagios/pnp/npcd.cfg
	mv "${D}"/etc/nagios/pnp/process_perfdata.cfg-sample "${D}"/etc/nagios/pnp/process_perfdata.cfg
	mv "${D}"/etc/nagios/pnp/rra.cfg-sample "${D}"/etc/nagios/pnp/rra.cfg

	mkdir -p "${D}"/var/nagios/perfdata
	mkdir -p "${D}"/var/nagios/spool/perfdata
	chown nagios:nagios "${D}"/var/nagios/perfdata
	chown nagios:nagios "${D}"/var/nagios/spool/perfdata
	chmod 775 "${D}"/var/nagios/perfdata
	chmod 775 "${D}"/var/nagios/spool/perfdata

	keepdir /etc/nagios/pnp
	keepdir /var/nagios
	keepdir /var/nagios/perfdata
	keepdir /var/nagios/spool/perfdata

	doinitd "${FILESDIR}"/npcd

}
