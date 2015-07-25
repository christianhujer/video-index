.PHONY: all
all: index.html thumbnails

.PHONY: thumbnails

-include thumbnails.d

thumbnails.d: thumbnails.xslt index.xml
	xsltproc -o $@ $^

.thumbnails/%.mp4.jpg: %.mp4 | .thumbnails/
	mkdir -p $(dir $@)
	avconv -i $< -vcodec mjpeg -vframes 1 -an -f rawvideo -ss `avconv -i $< 2>&1 | grep Duration | awk '{print $$2}' | tr -d , | awk -F ':' '{print $$3/2}'` $@

%/:
	mkdir -p $@

index.html: index.xslt index.xml
	xsltproc -o $@ $^
