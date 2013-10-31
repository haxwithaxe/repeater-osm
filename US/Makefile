.SHELL: /bin/bash
.PHONY: csv osm all clean clean-csv clean-osm

REPOBASE ?= ../
DATASRC ?= /tmp/
GPSBABLE ?= echo gpsbabel
GPSBABEL_IN_ARGS ?= \-i unicsv \-f
GPSBABEL_OUT_ARGS ?= \-o osm \-F

70cm-repeater-US.csv: $(DATASRC)seventy-cm\ Repeaters\ in\ the\ USA_V.csv
	$(REPOBASE)repeaterdb.sh -i "$^" -n 70cm-repeater-US

1.25m-repeater-US.csv: $(DATASRC)one-pointtwofive\ Meter\ Repeaters\ in\ the\ USA.csv
	$(REPOBASE)repeaterdb.sh -i "$^" -n 1.25m-repeater-US

2m-repeater-US.csv: $(DATASRC)two-Meter\ Repeaters\ in\ the\ USA.csv
	$(REPOBASE)repeaterdb.sh -i "$^" -n 2m-repeater-US

6m-repeater-US.csv: $(DATASRC)six\ Meter\ Repeaters\ in\ the\ USA.csv
	$(REPOBASE)repeaterdb.sh -i "$^" -n 6m-repeater-US

10m-repeater-US.csv: $(DATASRC)Ten-Meter\ Repeaters\ in\ the\ USA.csv
	$(REPOBASE)repeaterdb.sh -i "$^" -n 10m-repeater-US

csv: 70cm-repeater-US.csv 1.25m-repeater-US.csv 2m-repeater-US.csv 6m-repeater-US.csv 10m-repeater-US.csv

%.osm: %.csv
	$(GPSBABLE) $(GPSBABEL_IN_ARGS) $@ $(GPSBABEL_OUT_ARGS) $^

osm: 70cm-repeater-US.osm 1.25m-repeater-US.osm 2m-repeater-US.osm 6m-repeater-US.osm 10m-repeater-US.osm

all: osm

clean-osm:
	$(RM) 70cm-repeater-US.osm 1.25m-repeater-US.osm 2m-repeater-US.osm 6m-repeater-US.osm 10m-repeater-US.osm

clean-csv:
	$(RM) 70cm-repeater-US.csv 1.25m-repeater-US.csv 2m-repeater-US.csv 6m-repeater-US.csv 10m-repeater-US.csv

clean: clean-csv clean-osm
