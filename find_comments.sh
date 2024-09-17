#!/bin/bash

# Check if a URL was provided
if [ -z "$1" ]; then
  echo "Usage: $0 <URL>"
  exit 1
fi

# Use curl to get the HTML content of the webpage
html_content=$(curl -s "$1")

# Use grep and sed to extract comments from the HTML
comments=$(echo "$html_content" | grep -oP '(?<=<!--).*(?=-->)')

# Check if any comments were found
if [ -z "$comments" ]; then
  echo "No comments found."
else
  echo "Comments found in the webpage:"
  echo "$comments"
fi
