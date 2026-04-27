#!/bin/sh

# run with    face-parse.sh --input /full/path/to/input/images/ --output /full/path/to/output/
# faceparse will create a subfolder called resnet34/ inside of there with FILENAME_raw.png (actual mask for computer user) and FILE.png (for humans to see results)

(cd /Users/jupdike/Documents/dev/src/face-parsing && uv run python inference.py --model resnet34 --weight ./weights/resnet34.pt $@)
