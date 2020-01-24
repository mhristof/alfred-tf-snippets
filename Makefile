#
#

SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.ONESHELL:

DATA := $(shell find terraform-provider-aws/website/docs/d/ -name '*.markdown')
DATA := $(addprefix alfred/d-,$(notdir $(DATA)))

RESOURCES := $(shell find terraform-provider-aws/website/docs/r/ -name '*.markdown')
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
	create-json.sh $^

clean:
	rm -rf alfred
