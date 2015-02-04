prefix=/usr/local
sbindir=$(prefix)/sbin
sysconfdir=/etc
systemdir=$(sysconfdir)/systemd/system

SCRIPTS = docker-container-cleanup \
	  docker-image-cleanup

UNITS = docker-container-cleanup.service \
	docker-container-cleanup.timer \
	docker-image-cleanup.service \
	docker-image-cleanup.timer

all:

install: all
	install -m 755 $(SCRIPTS) $(DESTDIR)$(sbindir)/
	for unit in $(UNITS); do \
		sed 's|@sbindir@|$(sbindir)|g' $$unit > $(DESTDIR)$(systemdir)/$$unit; \
	done


