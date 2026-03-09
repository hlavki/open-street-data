#/bin/bash

#apt install -y transmission-cli

echo "--- Download OSM planet"
aria2c --seed-time=0 https://planet.openstreetmap.org/pbf/planet-latest.osm.pbf.torrent -d .
mkdir -p extracts

echo "--- Split data into one boundary per country"
papermill extracts-borders.ipynb extracts/_extracts-borders.ipynb
jupyter nbconvert --to html extracts/_extracts-borders.ipynb

echo "------------- FINISHED ---------------"
