#!/bin/bash

# Original filename
orig_file="MOD09GA.A2022276.h08v05.006.2022278033704.hdf"

# Find all directories within the 'fall' directory
dirs=$(find ./newWinter -maxdepth 1 -type d)

# Loop through each directory
for dir in $dirs
do
    # If directory is not the 'fall' directory itself
    if [ "$dir" != "./newWinter" ]
    then
        # Find all Landsat files within the directory
        files=$(find $dir -name "LC09_L1TP*.tif")

        # Loop through each file
        for file in $files
        do
            # Extract the date from the filename
            date_str=${file:44:8}  # Adjusted this to match the new file path

            seed_string=$date_str
            # Convert the string seed to an integer
            seed=$(echo -n "$seed_string" | md5 | awk '{printf "%d", "0x" $1}')

            # Set the seed for random number generation
            RANDOM=$(awk -v "seed=$seed" 'BEGIN{srand(seed); print int(rand() * 32767)}')


            echo $date_str
            year_str=${date_str:0:4}
            month_str=${date_str:4:2}
            day_str=${date_str:6:2}
            month=$((10#$month_str))
            day=$((10#$day_str))

            # Define the number of days in each month
            days_in_month=(0 31 28 31 30 31 30 31 31 30 31 30 31)

            # Calculate the total number of days
            total_days=0

            # Sum the number of days for each month preceding the given month
            for ((m=1; m<month; m++)); do
                total_days=$((total_days + ${days_in_month[m]}))
            done

            # Add the given day to the total
            total_days=$((total_days + day))
            total_days_load=$((total_days + 2))
            total_days_load_str=$(printf "%03d" $total_days_load)
            total_days_str=$(printf "%03d" $total_days)

            #echo $year_str $total_days_str $total_days_load_str

            random_time=$(printf "%02d%02d%02d" $((1 + RANDOM % 12)) $((RANDOM % 60)) $((RANDOM % 60)))
            #echo $random_time

            new_file="MOD09GA.A${year_str}${total_days_str}.h08v05.006.${year_str}${total_days_load_str}${random_time}.hdf"
            #echo $new_file
            # Copy and rename the file
            cp $orig_file "$dir/$new_file"
        done
    fi
done
