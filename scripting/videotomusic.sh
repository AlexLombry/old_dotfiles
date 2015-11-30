#!/bin/bash

INFILE="$1"
TMPOUTFILE="${INFILE%.*}"
OUTFILE="${TMPOUTFILE##*/}.m4a"

ffmpeg -i "${INFILE}" -vn -acodec copy "${OUTFILE}"
