#!/bin/bash
#
# The standard SRTM data had a rectangular hole of no data around New Bedford, MA.
# I downloaded the void-filled SRTM-3 data from the USGS EROS site. This site also
# has a helpful viewer to visualize the data and make sure it's okay before using it.

# Convert to hgt
CWD=$(pwd)
cd elevation_data/SRTM-3_void_filled
for file in *.tif; do
    base=$(echo $file | cut -f 1 -d '.')
    NORTH=$(echo $base | cut -f 1 -d '_' | cut -f 2 -d 'n')
    WEST=$(echo $base | cut -f 2 -d '_' | cut -f 2 -d 'w')
    gdal_translate -of SRTMHGT $file N${NORTH}W${WEST}.hgt
done

# Now process it
cd $CWD
gdalchop work/SRTM-3 elevation_data/SRTM-3_void_filled/*.hgt
# http://wiki.flightgear.org/Using_TerraGear#General_comments_from_forum_discussion
terrafit work/SRTM-3 -e 5 -x 20000
rm -f elevation_data/SRTM-3_void_filled/*.hgt
rm -f elevation_data/SRTM-3_void_filled/*.aux.xml
