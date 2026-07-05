# Project makefile

# declare targets as phony
.PHONY: build update upgrade clean clean-all

# build flake
build:
	sudo nixos-rebuild switch --flake .

# update
update:
	sudo nix flake update

# upgrade
upgrade: update
	sudo nixos-rebuild switch --flake .

# clean file fragments (except for previous builds and dependencies)
clean:
	nix-collect-garbage -d

# clean all file remnants (includes past builds)
clean-all:
	sudo nix-collect-garbage -d

