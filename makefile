TMP := $(shell echo $(PREVIOUS))
ifeq ($(findstring NAME_UNKNOWN,$(TMP)),NAME_UNKNOWN)
	FILTERED := 0.0.0
else
	FILTERED := $(shell echo $(PREVIOUS))
endif

SEMVER_EXPRESSION := ./semver bump prerel ${CI_JOB_ID} ${FILTERED}
VERSION := $(shell $(SEMVER_EXPRESSION))

ifeq ($(findstring *PATCH*,$(CI_COMMIT_MESSAGE)),*PATCH*)
	SEMVER_EXPRESSION := ./semver bump patch ${FILTERED}
	VERSION := $(shell $(SEMVER_EXPRESSION))
endif

ifeq ($(findstring *MINOR*,$(CI_COMMIT_MESSAGE)),*MINOR*)
	SEMVER_EXPRESSION := ./semver bump minor ${FILTERED}
	VERSION := $(shell $(SEMVER_EXPRESSION))
endif

ifeq ($(findstring *MAJOR*,$(CI_COMMIT_MESSAGE)),*MAJOR*)
	SEMVER_EXPRESSION := ./semver bump major ${FILTERED}
	VERSION := $(shell $(SEMVER_EXPRESSION))
endif
	
version:
	echo "$(VERSION)"