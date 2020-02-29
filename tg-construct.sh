#!/bin/bash

# Total extents
WEST=${WEST:--72}
EAST=${EAST:--69.5}
SOUTH=${SOUTH:-41}
NORTH=${NORTH:-41.9}    # This results in scenery extending to 42.125. Don't know
                        # why. It was found through trial and error.

# Note: Ocean landclass is not needed, as that will be the default when nothing else is
# there. ogr-decode won't even write any output data for Ocean shapefiles.
tg-construct --ignore-landmass --work-dir=./work --output-dir=./output/Terrain --min-lon=$WEST --max-lon=$EAST --min-lat=$SOUTH --max-lat=$NORTH AirportArea AirportObj Bog DeciduousForest DryCrop EvergreenForest Grassland Greenspace IrrCrop Lake Marsh MixedForest Rock SRTM-3 Sand Scrub Stream SubUrban Town Urban

