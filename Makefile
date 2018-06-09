modules = $(shell find . -type f -name '*.tf' -exec dirname {} \;|sort -u)

.PHONY: all
all: fmt validate

.PHONY: fmt
fmt:
	@for module in $(modules); do (terraform fmt -check=true "$$module") || exit 1 ; done

.PHONY: validate
validate:
	@for module in $(modules); do (terraform validate "$$module") || exit 1 ; done
