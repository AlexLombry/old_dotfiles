.PHONY: macos software vim links
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

## Prepare macOS system
macos:
	bash ./shell/macos.sh

## Install software
software:
	bash ./shell/software.sh

## Install vim
vim:
	bash ./shell/vim.sh

## Install links
links:
	bash ./shell/links.sh