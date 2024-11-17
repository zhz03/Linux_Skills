#!/bin/bash

# -----------------------------------------------------------------------------
# Shell Script: clean_conda_envs.sh
# Description: Deletes all Conda environments except those specified in the keep list.
# Usage: ./clean_conda_envs.sh
# -----------------------------------------------------------------------------

# Define the list of Conda environment names to keep
# Please add the environment names you want to keep here
KEEP_ENVS=(
    "base"               # Typically keep the base environment
    "opencda"            # Example: keep environment named my_env1
    "ui_zzl"            # Example: keep environment named my_env2
    "uitool"
    # Add more environment names to keep here
)

# -----------------------------------------------------------------------------
# Function: print_usage
# Description: Prints the script usage instructions
# -----------------------------------------------------------------------------
print_usage() {
    echo "Usage: $0"
    echo "This script deletes all Conda environments except those specified in the KEEP_ENVS list."
    echo "Ensure that you have correctly listed the environments you want to keep."
}

# -----------------------------------------------------------------------------
# Function: check_conda_installed
# Description: Checks if Conda is installed
# -----------------------------------------------------------------------------
check_conda_installed() {
    if ! command -v conda &> /dev/null
    then
        echo "Error: Conda is not installed or not in PATH. Please install Conda and ensure it is in your PATH."
        exit 1
    fi
}

# -----------------------------------------------------------------------------
# Function: get_all_conda_envs
# Description: Retrieves all Conda environment names
# -----------------------------------------------------------------------------
get_all_conda_envs() {
    conda env list | awk '{print $1}' | grep -v "^#" | grep -v "^$"
}

# -----------------------------------------------------------------------------
# Function: validate_keep_envs
# Description: Validates that the environments in the keep list exist
# -----------------------------------------------------------------------------
validate_keep_envs() {
    local all_envs=("$@")
    local missing_envs=()

    for env in "${KEEP_ENVS[@]}"
    do
        if [[ ! " ${all_envs[*]} " =~ " ${env} " ]]; then
            missing_envs+=("$env")
        fi
    done

    if [ ${#missing_envs[@]} -ne 0 ]; then
        echo "Warning: The following environments to keep do not exist:"
        for env in "${missing_envs[@]}"
        do
            echo "  - $env"
        done
        echo "Please check the environment names listed in KEEP_ENVS."
        # You can choose whether to continue execution. Below is set to continue.
        # If you want to exit when there are missing environments, uncomment the next line
        # exit 1
    fi
}

# -----------------------------------------------------------------------------
# Function: confirm_deletion
# Description: Prompts the user to confirm deletion
# -----------------------------------------------------------------------------
confirm_deletion() {
    echo "Are you sure you want to delete all Conda environments except the following?"
    for env in "${KEEP_ENVS[@]}"
    do
        echo "  - $env"
    done
    echo "This action cannot be undone."

    read -p "Type 'yes' to confirm deletion, or anything else to cancel: " CONFIRM

    if [ "$CONFIRM" != "yes" ]; then
        echo "Operation cancelled."
        exit 0
    fi
}

# -----------------------------------------------------------------------------
# Function: delete_envs
# Description: Deletes Conda environments not in the keep list
# -----------------------------------------------------------------------------
delete_envs() {
    local all_envs=("$@")
    local env_to_delete=()

    for env in "${all_envs[@]}"
    do
        if [[ ! " ${KEEP_ENVS[*]} " =~ " ${env} " ]]; then
            env_to_delete+=("$env")
        fi
    done

    if [ ${#env_to_delete[@]} -eq 0 ]; then
        echo "No Conda environments need to be deleted."
        exit 0
    fi

    for env in "${env_to_delete[@]}"
    do
        echo "Deleting environment: $env"
        conda env remove -n "$env" -y
        if [ $? -eq 0 ]; then
            echo "Environment '$env' deleted successfully."
        else
            echo "Error deleting environment '$env'."
        fi
    done

    echo "All Conda environments not in the keep list have been deleted."
}

# -----------------------------------------------------------------------------
# Main Script Execution Flow
# -----------------------------------------------------------------------------

# Check if help arguments are provided
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    print_usage
    exit 0
fi

# Check if Conda is installed
check_conda_installed

# Retrieve all Conda environments
ALL_CONDA_ENVS=($(get_all_conda_envs))

# Validate that the environments to keep exist
validate_keep_envs "${ALL_CONDA_ENVS[@]}"

# Prompt user to confirm deletion
confirm_deletion

# Delete environments not in the keep list
delete_envs "${ALL_CONDA_ENVS[@]}"

# -----------------------------------------------------------------------------
# Script End
# -----------------------------------------------------------------------------

