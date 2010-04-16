all: s3sync
	@echo $@ done.

clean: clean-s3sync
	@echo $@ done.

clean-s3sync:
	rm -rf s3sync.tar.gz s3sync
	@echo $@ done.
	
s3sync: s3sync.tar.gz
	tar zxf s3sync.tar.gz
	@echo $@ done.

s3sync.tar.gz:
	wget http://s3.amazonaws.com/ServEdge_pub/s3sync/s3sync.tar.gz
	@echo $@ done.
