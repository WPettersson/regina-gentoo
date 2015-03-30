# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
PYTHON_COMPAT=( python2{_6,_7} )

inherit eutils cmake-utils python-r1 subversion

DESCRIPTION="Software for 3-manifold topology and normal surface theory"
HOMEPAGE="http://regina.source-forge.net/"
ESVN_REPO_URI="http://regina.svn.sourceforge.net/svnroot/regina/trunk/regina"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+qt5 test sourcehighlight doc mpi"

RDEPEND="dev-libs/boost[python]
	${PYTHON_DEPS}
	dev-libs/gmp[cxx]
	dev-libs/popt
	dev-libs/libxml2
	qt5? (
		dev-qt/qtwidgets:5
		dev-qt/qtsvg:5
		sourcehighlight? (
			>=dev-util/source-highlight-3.1.1
		)
	)
	mpi? (
		virtual/mpi
	)"
DEPEND="${RDEPEND}
	doc? (
		app-doc/doxygen
		dev-libs/libxslt
	)
	test? (
		dev-util/cppunit
	)"
