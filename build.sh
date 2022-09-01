#!/bin/sh

# This is an example of some "process". Here it uses
# pandoc to convert from MarkDown to different formats
# and saves the output into "output_temp"

OUTPUT_DIR="output_temp"

mkdir "$OUTPUT_DIR"

pandoc -s main.md -o "$OUTPUT_DIR"/main.html
pandoc main.md -o "$OUTPUT_DIR"/main_bare.html
pandoc -s main.md -o "$OUTPUT_DIR"/main.pdf
pandoc -s main.md -o "$OUTPUT_DIR"/main.epub
pandoc -s main.md -o "$OUTPUT_DIR"/main.odt
pandoc -s main.md -o "$OUTPUT_DIR"/main.docx

date > "$OUTPUT_DIR"/.build_date.txt

echo "generated_at: $(date)" > variables.yml

mustache variables.yml index."$OUTPUT_DIR".html > "$OUTPUT_DIR"/index.html
mustache variables.yml README."$OUTPUT_DIR".md > "$OUTPUT_DIR"/README.md

