#
#

SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.ONESHELL:

CURRENT_BRANCH ?= $(shell git rev-parse --abbrev-ref HEAD)
DATA := $(shell find terraform-provider-aws/website/docs/d/ -name '*.markdown' 2>/dev/null)
DATA := $(addprefix alfred/d-,$(notdir $(DATA)))

RESOURCES := $(shell find terraform-provider-aws/website/docs/r/ -name '*.markdown' 2>/dev/null)
RESOURCES := $(addprefix alfred/r-,$(notdir $(RESOURCES)))

JSON := $(addsuffix .json,$(RESOURCES))
JSON += $(addsuffix .json,$(DATA))

default: alfred $(DATA) $(RESOURCES) $(JSON)

alfred:
	mkdir -p alfred

terraform-provider-aws:
	git clone https://github.com/terraform-providers/terraform-provider-aws

alfred.json: $(JSON)


alfred/d-%: terraform-provider-aws/website/docs/d/%
	cat $^ | codedown hcl > $@

alfred/r-%: terraform-provider-aws/website/docs/r/%
	cat $^ | codedown hcl > $@

%.json: %
	./create-json.sh $^

zip:
	git archive --format=zip HEAD > alfred-tf-snippets.alfredworkflow

version:
	@grep version info.plist -A1 | tail -1  | grep -oP '[\d\.]*'

fragment:
	@echo $(CURRENT_BRANCH) | tr -s '-' ' ' | cut -d ' ' -f1

clean:
	rm -rf alfred
