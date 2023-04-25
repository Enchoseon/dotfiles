#!/usr/bin/env bash
# Parse Vimwiki's Arguments
OUTPUT_DIRECTORY=$4 # Absolute path to the output directory
INPUT_FILE=$5 # Absolute path to the input file
OUTPUT_FILE=$(basename -- "${INPUT_FILE}")
OUTPUT_FILE="${OUTPUT_FILE%.*}" # Output filename (without any path attached)
# Create directory
mkdir -p "${OUTPUT_DIRECTORY}"
# Run Pandoc
eval pandoc "-i \"${INPUT_FILE}\" --katex --standalone --highlight-style=pygments --wrap=preserve -f markdown -t html -o \"${OUTPUT_DIRECTORY}/${OUTPUT_FILE}\"" > /dev/null 2>&1
