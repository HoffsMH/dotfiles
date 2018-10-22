GPGID = matthecker@pm.me
GPG = gpg
DATE = $$(date +"%Y-%m-%d")
DATETAR = $(DATE)-$(FINGER_PRINT).tar

ORGFILES=$(wildcard *.org)
FINGER_PRINT = $$(cat $(ORGFILES) | sha1sum | awk '{print substr($$0,3,10)}')
TARFILES = $(wildcard *.tar)
GPGFILES = $(wildcard *.gpg)
TAR = tar

all:
	@echo ""
	@echo "usage:"
	@echo ""
	@echo "* make lock"
	@echo "* make unlock"
	@echo "* make archive"
	@echo ""

lock: $(ORGFILES)
	@umask 0077;\
		tar -cf $(DATETAR) $(ORGFILES) && \
	  $(GPG) --encrypt --recipient $(GPGID) $(DATETAR)
		rm -fr $(wildcard *.org) && \
		rm -fr *.tar && \
		make archive

unlock: $(GPGFILES) $(TARFILES)
	for gpgfile in $(GPGFILES) ; do \
		$(GPG) --use-embedded-filename --decrypt $$gpgfile ; \
	done; \
	for tarfile in *.tar; do \
		$(TAR) -xf $$tarfile; \
	done && \
	rm -fr $(GPGFILES)
	rm -fr *.tar

archive: $(GPGFILES)
	cp -av $(GPGFILES)  ~/personal/personal-reference/jrnlarchive
