#!/bin/bash

export PYTHONPATH=/home/dan/Projects/FGScenery_tools/osm2city:$PYTHONPATH
export FG_ROOT=/usr/share/FlightGear
export JAVACMD_OPTIONS=-Djava.io.tmpdir=/home/dan/Desktop
python3 /home/dan/Projects/FGScenery_tools/osm2city/build_tiles.py --logtofile -f params2.ini -b *-71.25_41.0_-70.5_42.15 -p 3
