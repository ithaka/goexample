DOCKER_REGISTRY   ?= artifactory.acorn.cirrostratus.org
IMAGE_PREFIX      ?= cypress
SHORT_NAME        ?= simple-go-server

# build options
GO        ?= go
TAGS      :=
LDFLAGS   := -w -s
GOFLAGS   :=
BINDIR    := $(CURDIR)/bin

.PHONY: all
all: clean docker-binary docker-build docker-push

.PHONY: build
build:
	GOBIN=$(BINDIR) $(GO) install $(GOFLAGS) -tags '$(TAGS)' -ldflags '$(LDFLAGS)'

.PHONY: clean
clean:
	@rm -rf $(BINDIR)

include versioning.mk
