EYES=./bin/eyes

.PHONY: compile src bin clean test pkg-valid

compile: src bin

src:
	@mkdir -p lib
	@coffee -c -o lib src

clean:
	@rm -Rf lib

test:
	@./test/test.sh

pkg-valid:
	@json --validate < package.json


