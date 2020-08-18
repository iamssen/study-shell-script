#!/usr/bin/env bash

for file in ./*.sh; do
  if [ "$file" != "./index.sh" ]; then
    echo "$file"

    if ! bash "$file"; then
      echo "error on $file!!!"
      exit 1
    fi
  fi
done
