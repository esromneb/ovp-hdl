all: build


include make_include/version.mk


build:
	@echo "Will Build"
	UID_FILENAME=gen/example_version.sv make version

clean:
	rm -rf gen/example_version.sv

.PHONY: build clean
