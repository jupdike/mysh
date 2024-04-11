#! /bin/sh

# brew install vorbis-tools
# brew install lame

for file in *.ogg
do
  ogg123 -d wav -f - "$file" | lame --preset extreme - "$(basename "$file" .ogg).mp3"
done
