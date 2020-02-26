#!/bin/bash

#OGR=$(wine ~/Projects/FGScenery_tools/TerraGear-Windows/ogr-decode.exe)
OGR=ogr-decode

# Landcover
for file in landcover/data/shapefiles/NLCD/*.shp; do
    fname=$(basename $file)
    area_type=$(echo $fname | cut -f 1 -d '.')
    $OGR --area-type $area_type work/$area_type $file
done

# Waterways from OSM (BBBike.org extract service)
$OGR --max-segment 500 --line-width 18 --area-type Stream work/Stream landcover/data/shapefiles/osm/waterways.shp
