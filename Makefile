VERSION=latest
DEBNAME=steam_$(VERSION).deb

all: repo data.tar.gz com.valve.Steam.json
	rm -rf steam
	flatpak-builder --repo=repo steam com.valve.Steam.json --arch=i386

$(DEBNAME):
	wget "http://repo.steampowered.com/steam/archive/precise/$(DEBNAME)"

data.tar.gz: $(DEBNAME)
	ar x $(DEBNAME)

repo:
	ostree init --mode=archive-z2 --repo=repo
