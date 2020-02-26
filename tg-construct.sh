#!/bin/bash

function construct ()
{
    local WBND=$1
    local EBND=$2
    local SBND=$3
    local NBND=$4

    # Note: Ocean landclass is not needed, as that will be the default when nothing else is
    # there. ogr-decode won't even write any output data for Ocean shapefiles.
    tg-construct --ignore-landmass --work-dir=./work --output-dir=./output/Terrain --min-lon=$WBND --max-lon=$EBND --min-lat=$SBND --max-lat=$NBND AirportArea AirportObj Bog DeciduousForest DryCrop EvergreenForest Grassland Greenspace IrrCrop Lake Marsh MixedForest Rock SRTM-3 Sand Scrub Stream SubUrban Town Urban
}

# Total extents
WEST=${WEST:--72}
EAST=${EAST:--69.6}
SOUTH=${SOUTH:-41}
NORTH=${NORTH:-42.15}

construct $WEST $EAST $SOUTH $NORTH
