#!/bin/bash

# Function to count the number of files in the current directory
count_files() {
    local count=$(ls -1 | wc -l)
    echo "$count"
}

# Function to generate the makefile
generate_makefile() {
    cat <<EOF > makefile
# Define variables
SCRIPT_FILE = guessinggame.sh
README_FILE = README.md

# Default target
all: \$(README_FILE)

# Rule to generate README.md
\$(README_FILE): \$(SCRIPT_FILE)
	@echo "# Guessing Game Project" > \$(README_FILE)
	@echo >> \$(README_FILE)
	@echo "Date and Time of Make: \$\$(date)" >> \$(README_FILE)
	@echo >> \$(README_FILE)
	@echo "Number of lines of code in \$(SCRIPT_FILE): \$\$(wc -l < \$(SCRIPT_FILE))" >> \$(README_FILE)
	@echo >> \$(README_FILE)
	@echo "GitHub Pages URL: https://git@github.com:GaryChizm/my-2-repo.git" >> \$(README_FILE)

# Disable cleaning rule
.PHONY: clean
clean:
	@echo "Clean rule disabled. README.md must stay."
EOF
}

# Main function
main() {
    local num_files=$(count_files)

    echo "Welcome to the Guessing Game!"
    echo "Guess the number of files in the current directory:"

    while true; do
        read -p "Enter your guess: " guess

        if [[ $guess -lt $num_files ]]; then
            echo "Your guess is too low. Try again!"
        elif [[ $guess -gt $num_files ]]; then
            echo "Your guess is too high. Try again!"
        else
            echo "Congratulations! You guessed the correct number of files: $num_files"
            generate_makefile
            echo "Makefile generated."
            break
        fi
    done
}

# Execute the main function
main

