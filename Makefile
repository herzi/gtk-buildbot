PACKAGE=gtk-buildbot
VERSION=2010.04.29
BUILDDIR=build
DISTDIR=$(PACKAGE)-$(VERSION)
SRVDIR=/srv/jhbuildbot/gtk-buildmaster
SLVDIR=/srv/jhbuildbot/gtk-buildslave

all: build.stamp

build.stamp:
	mkdir -p ${BUILDDIR}
	lndir -silent /usr/share/jhbuild/buildbot ${BUILDDIR}
	rm ${BUILDDIR}/master.cfg
	cp master.cfg ${BUILDDIR}
	touch $@

distdir:
	mkdir -p $(DISTDIR)
	cp gtk-buildmaster gtk-buildslave Makefile master.cfg jhbuildrc.master jhbuildrc.slave slaves.csv $(DISTDIR)

dist: distdir
	tar czf $(DISTDIR).tar.gz $(DISTDIR)
	rm -rf $(DISTDIR)

distcheck: dist
	rm -rf /tmp/$(DISTDIR)
	cat $(DISTDIR).tar.gz | (cd /tmp && tar xz)
	cd /tmp/$(DISTDIR) && $(MAKE) && $(MAKE) install DESTDIR="$(shell mktemp -d)"

install-slave:
	install -d $(DESTDIR)$(SLVDIR)
	install jhbuildrc.slave $(DESTDIR)$(SLVDIR)/.jhbuildrc
	install -d $(DESTDIR)$(SLVDIR)/bin
	install gtk-buildslave $(DESTDIR)$(SLVDIR)/bin

install-server:
	install -d $(DESTDIR)$(SRVDIR)
	install jhbuildrc.master $(DESTDIR)$(SRVDIR)/jhbuildrc
	install -d $(DESTDIR)$(SRVDIR)/bin
	install gtk-buildmaster $(DESTDIR)$(SRVDIR)/bin
	install -d $(DESTDIR)$(SRVDIR)/builddir
	install ${BUILDDIR}/master.cfg $(DESTDIR)$(SRVDIR)/builddir
	install ${BUILDDIR}/template.html $(DESTDIR)$(SRVDIR)/builddir
	install -d $(DESTDIR)$(SRVDIR)/builddir/public_html
	install ${BUILDDIR}/public_html/bar.png $(DESTDIR)$(SRVDIR)/builddir/public_html
	install ${BUILDDIR}/public_html/building.png $(DESTDIR)$(SRVDIR)/builddir/public_html
	install ${BUILDDIR}/public_html/cyan-bar.png $(DESTDIR)$(SRVDIR)/builddir/public_html
	install ${BUILDDIR}/public_html/download.png $(DESTDIR)$(SRVDIR)/builddir/public_html
	install ${BUILDDIR}/public_html/emptyimg.png $(DESTDIR)$(SRVDIR)/builddir/public_html
	install ${BUILDDIR}/public_html/error.png $(DESTDIR)$(SRVDIR)/builddir/public_html
	install ${BUILDDIR}/public_html/feed-atom.png $(DESTDIR)$(SRVDIR)/builddir/public_html
	install ${BUILDDIR}/public_html/feed.png $(DESTDIR)$(SRVDIR)/builddir/public_html
	install ${BUILDDIR}/public_html/figure.png $(DESTDIR)$(SRVDIR)/builddir/public_html
	install ${BUILDDIR}/public_html/foot-16.png $(DESTDIR)$(SRVDIR)/builddir/public_html
	install ${BUILDDIR}/public_html/foot.png $(DESTDIR)$(SRVDIR)/builddir/public_html
	install ${BUILDDIR}/public_html/general_bg.png $(DESTDIR)$(SRVDIR)/builddir/public_html
	install ${BUILDDIR}/public_html/general_separator.png $(DESTDIR)$(SRVDIR)/builddir/public_html
	install ${BUILDDIR}/public_html/gnome-16.png $(DESTDIR)$(SRVDIR)/builddir/public_html
	install ${BUILDDIR}/public_html/gnome-64.png $(DESTDIR)$(SRVDIR)/builddir/public_html
	install ${BUILDDIR}/public_html/gnome-gtp.png $(DESTDIR)$(SRVDIR)/builddir/public_html
	install ${BUILDDIR}/public_html/green-bar.png $(DESTDIR)$(SRVDIR)/builddir/public_html
	install ${BUILDDIR}/public_html/idle.png $(DESTDIR)$(SRVDIR)/builddir/public_html
	install ${BUILDDIR}/public_html/images.jpeg $(DESTDIR)$(SRVDIR)/builddir/public_html
	install ${BUILDDIR}/public_html/index.html $(DESTDIR)$(SRVDIR)/builddir/public_html
	install ${BUILDDIR}/public_html/info.png $(DESTDIR)$(SRVDIR)/builddir/public_html
	install ${BUILDDIR}/public_html/lgo.css $(DESTDIR)$(SRVDIR)/builddir/public_html
	install ${BUILDDIR}/public_html/logo.png $(DESTDIR)$(SRVDIR)/builddir/public_html
	install ${BUILDDIR}/public_html/nobody.png $(DESTDIR)$(SRVDIR)/builddir/public_html
	install ${BUILDDIR}/public_html/offline.png $(DESTDIR)$(SRVDIR)/builddir/public_html
	install ${BUILDDIR}/public_html/purple-bar.png $(DESTDIR)$(SRVDIR)/builddir/public_html
	install ${BUILDDIR}/public_html/red-bar.png $(DESTDIR)$(SRVDIR)/builddir/public_html
	install ${BUILDDIR}/public_html/robot.png $(DESTDIR)$(SRVDIR)/builddir/public_html
	install ${BUILDDIR}/public_html/robots.txt $(DESTDIR)$(SRVDIR)/builddir/public_html
	install ${BUILDDIR}/public_html/star.png $(DESTDIR)$(SRVDIR)/builddir/public_html
	install ${BUILDDIR}/public_html/tab_left.png $(DESTDIR)$(SRVDIR)/builddir/public_html
	install ${BUILDDIR}/public_html/tab_right.png $(DESTDIR)$(SRVDIR)/builddir/public_html
	install ${BUILDDIR}/public_html/top-header-gradient.png $(DESTDIR)$(SRVDIR)/builddir/public_html
	install ${BUILDDIR}/public_html/t.png $(DESTDIR)$(SRVDIR)/builddir/public_html
	install ${BUILDDIR}/public_html/warn.png $(DESTDIR)$(SRVDIR)/builddir/public_html
	install ${BUILDDIR}/public_html/webpage.png $(DESTDIR)$(SRVDIR)/builddir/public_html
	install -d $(DESTDIR)$(SRVDIR)/slaves
	install slaves.csv $(DESTDIR)$(SRVDIR)/slaves

install: install-slave install-server
