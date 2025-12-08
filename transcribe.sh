#!/bin/bash
# Check if an input file is provided
if [ -z "$1" ]; then
  echo "Usage: $0 input_audio_file"
  exit 1
fi

input_file="$1"
base_name=$(basename "$input_file" | sed 's/\.[^.]*$//')

# Convert input audio to 16kHz mono WAV and pipe to whisper-cpp
ffmpeg -i "$input_file" -ar 16000 -ac 1 -f wav - | \
  whisper-cli --model ~/Downloads/ggml-large-v3-turbo-q8_0.bin \
  --output-srt --language en --output-file "$base_name" -
