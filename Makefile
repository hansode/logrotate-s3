all: vendors conf
	@echo $@ done.

clean:
	[ -d vendor ] || mkdir vendor
	(cd vendor && make clean)
	[ -f config/local ] && rm -f config/local || :
	@echo $@ done.
	
vendors:
	[ -d vendor ] || mkdir vendor
	(cd vendor && make)
	@echo $@ done.

conf:
	[ -d config ] || exit 1
	[ -f config/local ] || (cd config && cp -f _local.tmpl local)
	@echo $@ done.
