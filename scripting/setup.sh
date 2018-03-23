#!/bin/bash

# Create to first line of file (overwrites)
echo "swatch" > dataset.txt

a=0
for i in *.jpg; do
    # Skip the `base.jpg` file.
    if [ "$i" = "base.jpg" ]; then
        continue
    fi
    
    new=$(printf "%d.jpg" "$a")
    echo "$new"
    mv -i -- "$i" "$new"

    # Append to file (note the ">>")
    echo "$new" >> dataset.txt
    let a=a+1
done

echo "===== DATASET ====="
cat dataset.txt
