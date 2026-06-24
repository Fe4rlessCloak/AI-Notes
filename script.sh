#!/bin/bash

# Exit on error
set -e

# Prepare
mkdir -p extractedKritaDocuments

# Extract merged images from .kra files
for kritaDocument in *.kra
do
    unzip -p "$kritaDocument" mergedimage.png > "extractedKritaDocuments/${kritaDocument%.kra}.png"
done

# Convert and merge into PDF
cd extractedKritaDocuments

# Use magick (ImageMagick v7)
magick *.png ../all.pdf

cd ..

# Clean up
rm -r extractedKritaDocuments

echo "Done! Created all.pdf"
