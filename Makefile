# Project makefile

# declare targets as phony
.PHONY: build clean-home clean-all

# build flake
build:
	sudo nixos-rebuild switch --flake .

# build and upgrade
upgrade:
	sudo nixos-rebuild switch --upgrade --flake .

# clean file fragments (except for previous builds and dependencies)
clean-home:
	nix-collect-garbage -d

# clean all file remnants (includes past builds)
clean-all:
	sudo nix-collect-garbage -d

