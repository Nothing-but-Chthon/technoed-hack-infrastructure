#!/bin/bash

for file in /mongo-seed/*.json; do
  collection=$(basename "$file" .json)
  mongoimport --db mydatabase --collection "$collection" --file "$file" --jsonArray
done
