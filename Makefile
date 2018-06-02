.PHONY: all
all: bootstrap.yaml

.PHONY: bootstrap.yaml
bootstrap.yaml:
	@cfn-lint --template $@
