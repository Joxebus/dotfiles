#!/bin/bash 

function split_file() {
    ffmpeg -i $input_file -ss $time_start -t $shrink_length -q:a 0 -map a $output_file
}

if [ "$#" -lt 3 ]; then
    echo "Usage: convert-audio input_file.avi output_file.mp3 time_start shrink_length \n"
    echo "IMPORTANT: If shrink length not specified ffmpeg will cut till end of file."
    exit 1
else
    input_file=$1
    output_file=$2
    time_start=$3
    shrink_length=$4

    echo "==================Starting split============================"
    split_file $input_file $output_file $time_start $shrink_length
fi
