#!/bin/bash

for file in *.wiki
do
  mv "$file" "${file%.wiki}.md"
done
