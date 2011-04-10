# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/zentest/zentest-4.5.0.ebuild,v 1.1 2011/02/19 08:28:24 graaff Exp $

EAPI=2

USE_RUBY="ruby18 ree18 ruby19 jruby"

RUBY_FAKEGEM_NAME=dnsruby

#RUBY_FAKEGEM_TASK_DOC="docs"
RUBY_FAKEGEM_TASK_DOC="rdoc"
RUBY_FAKEGEM_DOCDIR="html"
RUBY_FAKEGEM_EXTRADOC="DNSSEC EVENTMACHINE EXAMPLES README"

inherit ruby-fakegem

DESCRIPTION="Ruby DNS client library"
HOMEPAGE="http://rubyforge.org/projects/dnsruby/"
LICENSE="Ruby"

KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~x64-solaris ~x86-solaris"
SLOT="0"
IUSE=""

DEPEND="
	doc? (
		media-gfx/graphviz
		>=dev-ruby/rdoc-3.5.1
	)
"

