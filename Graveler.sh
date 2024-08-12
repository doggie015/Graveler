#!/bin/bash

# Function to calculate elapsed time in milliseconds
function calculate_time() {
  local start_time=$1
  local end_time=$2
  local elapsed=$((end_time - start_time))
  echo "Time taken: ${elapsed} milliseconds."
}

# Initialize a counter for the number of rolls and an array to store counts for numbers 1-4
total_rolls=0
counts=(0 0 0 0)

# Record the start time in milliseconds
start_time=$(date +%s%3N)

# Loop until the count for number 1 reaches 177
while true; do
  # Simulate rolling a 4-sided die (1-4)
  roll=$((RANDOM % 4 + 1))
  
  # Increment the corresponding count
  ((counts[roll-1]++))
  ((total_rolls++))  # Increment the total number of rolls
  
  # Check if the count for number 1 has reached 177
  if [ ${counts[0]} -eq 177 ]; then
    echo "Number 1 reached 177 rolls."
    break
  fi
done

# Record the end time in milliseconds
end_time=$(date +%s%3N)

# Calculate and print the time taken in milliseconds
calculate_time $start_time $end_time

# Output the total number of rolls
echo "Total number of rolls needed: $total_rolls"

# Print final counts (optional)
echo "Final counts: ${counts[@]}"

