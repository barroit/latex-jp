# SPDX-License-Identifier: MIT

name := latex-jp
vsix := $(name).vsix

input := $(wildcard syntaxes/*.tmLanguage.json)

.PHONY: install uninstall

$(vsix): package.json $(input)
	vsce package --no-dependencies -o $@

install: $(vsix)
	code --install-extension $<

uninstall:
	code --uninstall-extension \
	     $$(code --list-extensions | grep $(name) || printf '39\n')
