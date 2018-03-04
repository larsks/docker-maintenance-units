prefix=/usr/local
sysconfdir=/etc
systemdir=$(sysconfdir)/systemd/system

SERVICES = docker-container-cleanup.service \
	   docker-image-cleanup.service

TIMERS = \
	docker-container-cleanup.timer \
	docker-image-cleanup.timer

all:

install: install-units

install-units:
	for unit in $(TIMERS) $(SERVICES); do \
		install -m 644 $$unit $(DESTDIR)$(systemdir)/$$unit; \
	done

enable-timers:
	for unit in $(TIMERS); do \
		systemctl enable $$unit; \
		systemctl start $$unit; \
	done
