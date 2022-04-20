ifeq ($(leaf_spine_onboarding),true)
ifeq ($(OR_PODS), testbed1)
SKIP_TAGS_VARS += topolology_url
else ifeq ($(OR_PODS),testbed2)
SKIP_TAGS_VARS += negative
else ifeq ($(OR_PODS),testbed3)
SKIP_TAGS_VARS += combo
else ifeq ($(OR_PODS),testbed4)
SKIP_TAGS_VARS += positive
endif
endif

TESTBED_NAME = $(shell -oP "<testbed name=(.*)" src/topology/topology.xml | cut -d "=" -f 2 | cut -d ">" -f 1)

.PHONY: test-leaf-spine-onboarding
test-leaf-spine-onboarding:
	@echo leaf_spine_onboarding
	@echo leaf_spine_onboarding TESTBED_NAME
#	robot --include $(SKIP_TAGS_VARS) test_suite/onboarding/
