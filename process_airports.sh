#!/bin/bash

# I have apt.dat at ~/Projects/FGScenery_tools/Airports/apt.dat (copy it here before
# running to make things simpler for docker)
genapts850 --input=apt.dat --work=./work --dem-path=SRTM-3 --min-lat=41.0 --max-lat=42.15 --min-lon=-72 --max-lon=-69.5
