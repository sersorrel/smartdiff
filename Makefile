PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/sbin

smartdiff:

.PHONY: install
install:
	install smartdiff $(BINDIR)
