# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-client/chromium/chromium-9999-r1.ebuild,v 1.106 2012/04/26 06:35:27 phajdan.jr Exp $

EAPI="4"
PYTHON_DEPEND="2:2.6"


inherit eutils cmake-utils python

DESCRIPTION="Software for 3-manifold topology and normal surface theory"
HOMEPAGE="http://regina.source-forge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+qt4 cppunit sourcehighlight doc mpi"

RDEPEND="dev-libs/boost[python]
	dev-lang/python
	dev-libs/gmp[cxx]
	dev-libs/popt
	dev-libs/libxml2
	qt4? (
		>=x11-libs/qt-core-4.6
		>=x11-libs/qt-gui-4.6
	)
	cppunit? (
		dev-util/cppunit
	)
	sourcehighlight? (
		>=dev-util/source-highlight-3.1.1
	)
	doc? (
		app-doc/doxygen
		dev-libs/libxslt
		)
	mpi? (
		virtual/mpi
	) "
DEPEND="${RDEPEND}"
