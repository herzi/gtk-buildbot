PACKAGE=gtk-buildmaster
VERSION=2010.04.28
BUILDDIR=build
DISTDIR=$(PACKAGE)-$(VERSION)

all: build.stamp

build.stamp:
	mkdir -p ${BUILDDIR}
	lndir -silent /usr/share/jhbuild/buildbot ${BUILDDIR}
	rm ${BUILDDIR}/master.cfg
	cp master.cfg ${BUILDDIR}
	touch $@

distdir:
	mkdir -p $(DISTDIR)
	cp gtk-buildmaster Makefile master.cfg jhbuildrc $(DISTDIR)

dist: distdir
	tar czf $(DISTDIR).tar.gz $(DISTDIR)
	rm -rf $(DISTDIR)

distcheck: dist
	rm -rf /tmp/$(DISTDIR)
	cat $(DISTDIR).tar.gz | (cd /tmp && tar xz)
	cd /tmp/$(DISTDIR) && $(MAKE) && $(MAKE) install DESTDIR="$(shell mktemp -d)"

install:
	install -d $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)
	install jhbuildrc $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/jhbuildrc
	install -d $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/bin
	install gtk-buildmaster $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/bin
	install -d $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/builddir
	install ${BUILDDIR}/master.cfg $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/builddir
	install ${BUILDDIR}/template.html $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/builddir
	install -d $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/builddir/public_html
	install ${BUILDDIR}/public_html/bar.png $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/builddir/public_html
	install ${BUILDDIR}/public_html/building.png $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/builddir/public_html
	install ${BUILDDIR}/public_html/cyan-bar.png $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/builddir/public_html
	install ${BUILDDIR}/public_html/download.png $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/builddir/public_html
	install ${BUILDDIR}/public_html/emptyimg.png $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/builddir/public_html
	install ${BUILDDIR}/public_html/error.png $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/builddir/public_html
	install ${BUILDDIR}/public_html/feed-atom.png $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/builddir/public_html
	install ${BUILDDIR}/public_html/feed.png $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/builddir/public_html
	install ${BUILDDIR}/public_html/figure.png $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/builddir/public_html
	install ${BUILDDIR}/public_html/foot-16.png $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/builddir/public_html
	install ${BUILDDIR}/public_html/foot.png $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/builddir/public_html
	install ${BUILDDIR}/public_html/general_bg.png $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/builddir/public_html
	install ${BUILDDIR}/public_html/general_separator.png $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/builddir/public_html
	install ${BUILDDIR}/public_html/gnome-16.png $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/builddir/public_html
	install ${BUILDDIR}/public_html/gnome-64.png $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/builddir/public_html
	install ${BUILDDIR}/public_html/gnome-gtp.png $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/builddir/public_html
	install ${BUILDDIR}/public_html/green-bar.png $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/builddir/public_html
	install ${BUILDDIR}/public_html/idle.png $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/builddir/public_html
	install ${BUILDDIR}/public_html/images.jpeg $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/builddir/public_html
	install ${BUILDDIR}/public_html/index.html $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/builddir/public_html
	install ${BUILDDIR}/public_html/info.png $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/builddir/public_html
	install ${BUILDDIR}/public_html/lgo.css $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/builddir/public_html
	install ${BUILDDIR}/public_html/logo.png $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/builddir/public_html
	install ${BUILDDIR}/public_html/nobody.png $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/builddir/public_html
	install ${BUILDDIR}/public_html/offline.png $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/builddir/public_html
	install ${BUILDDIR}/public_html/purple-bar.png $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/builddir/public_html
	install ${BUILDDIR}/public_html/red-bar.png $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/builddir/public_html
	install ${BUILDDIR}/public_html/robot.png $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/builddir/public_html
	install ${BUILDDIR}/public_html/robots.txt $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/builddir/public_html
	install ${BUILDDIR}/public_html/star.png $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/builddir/public_html
	install ${BUILDDIR}/public_html/tab_left.png $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/builddir/public_html
	install ${BUILDDIR}/public_html/tab_right.png $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/builddir/public_html
	install ${BUILDDIR}/public_html/top-header-gradient.png $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/builddir/public_html
	install ${BUILDDIR}/public_html/t.png $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/builddir/public_html
	install ${BUILDDIR}/public_html/warn.png $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/builddir/public_html
	install ${BUILDDIR}/public_html/webpage.png $(DESTDIR)/srv/jhbuildbot/$(PACKAGE)/builddir/public_html
