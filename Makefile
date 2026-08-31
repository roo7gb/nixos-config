# Project makefile

# declare targets as phony
.PHONY: build update upgrade clean clean-all

# build flake
build-TARDIS:
	sudo nixos-rebuild switch --flake .#TARDIS

build-firefly:
	sudo nixos-rebuild switch --flake .#FIREFLY

# update
update:
	sudo nix flake update

# upgrade
upgrade-TARDIS: update
	sudo nixos-rebuild switch --flake .#TARDIS

upgrade-firefly: update
	sudo nixos-rebuild switch --flake .#FIREFLY

# clean file fragments (except for previous builds and dependencies)
clean:
	nix-collect-garbage -d

# clean all file remnants (includes past builds)
clean-all:
	sudo nix-collect-garbage -d

