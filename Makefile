# Define variables
SCRIPT_FILE = guessinggame.sh
README_FILE = README.md

# Default target
all: $(README_FILE)

# Rule to generate README.md
$(README_FILE): $(SCRIPT_FILE)
	@echo "# Guessing Game Project" > $(README_FILE)
	@echo >> $(README_FILE)
	@echo "Date and Time of Make: $$(date)" >> $(README_FILE)
	@echo >> $(README_FILE)
	@echo "Number of lines of code in $(SCRIPT_FILE): $$(wc -l < $(SCRIPT_FILE))" >> $(README_FILE)
	@echo >> $(README_FILE)
	@echo "GitHub Pages URL: https://github.com/GaryChizm/my-2-repo.git" >> $(README_FILE)

# Disable cleaning rule
.PHONY: clean
clean:
	@echo "Clean rule disabled. README.md must stay."
