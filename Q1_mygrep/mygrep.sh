#!/bin/bash

option="$1"
pattern="$2"
filename="$3"

if [ $# -lt 1 ]; then
	echo "Error: missing arguments" >&2
	exit 1
	fi

if [ "$1" = "--help" ]; then
        echo "Usage: $0 [-n] [-v] pattern filename"
        echo "Search for a string (case-insensitive) in a file."
        echo "Options:"
        echo "  -n    Show line numbers for each match"
        echo "  -v    Invert match (print non-matching lines)"
        echo "  --help Display this help message"
        exit 0
fi

if [[ "$1" == -* ]]; then
	option="$1"
	if [[ "$2" == *.txt ]]; then
	echo "Warning: missing search string" >&2
	exit 1
	fi
	pattern="$2"
	filename="$3"
else	# Handle the case where no option is provided
        option=""
        pattern="$1"
        filename="$2"
fi


	# Handle the cases where no pattern or filename provided
if [ -z "$pattern" ]; then
	echo "Error: missing pattern argument" >&2
	exit 1
	fi
if [ -z "$filename" ]; then
	echo "Error: missing filename argument" >&2
        exit 1
    fi


if [[ ! -f "$filename" ]]; then				#checks if file name exists
	echo "Error: File '$filename' not found!" >&2
	exit 1
	fi

if [ "$option" == "-n" ]; then
         grep -i --color=always -n "$pattern" "$filename"
elif [ "$option" == "-v" ]; then
         grep -i --color=always -v "$pattern" "$filename"
elif [ "$option" == "-vn" ] || [ "$option" == "-nv" ]; then
	grep -i --color=always -v -n "$pattern" "$filename"
elif [ -z "$option" ]; then
	 grep -i --color=always "$pattern" "$filename"
else
         echo "Invalid option: $option" >&2
         exit 1
fi
