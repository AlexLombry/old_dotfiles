.PHONY: macos software vim links debug
.SILENT:
.DEFAULT_GOAL= help

help:
	printf "Dotfiles\n\n"
	awk '/^[a-zA-Z\-\_0-9]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")-1); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf "%-15s %s\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)

## || 01 - Prepare macOS system
macos:
	bash ./scripts/macos.sh

## || 02 - Install software
software:
	bash ./scripts/software.sh

## || 03 - Install vim
vim:
	bash ./scripts/vim.sh

## || 04 - Install links
links:
	bash ./scripts/links.sh

## || Debug command
debug:
	bash ./scripts/debug.sh