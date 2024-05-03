#!/bin/bash

# Default configurations
XM=256m
VERSION=4.0.0
COMMANDTIMEOUT=300

# Initialize names and path configurations
domain_name="domain"
problem_name=""
complete_path=""

# Relative path to the PDDL benchmarks
path="../../pddl4j/src/test/resources/benchmarks/pddl"
# Array of folders to navigate through
ipc_folders=("ipc2000" "ipc2002" "ipc1998" "ipc1998")
benchmarks=("blocks" "depots" "gripper" "logistics")
benchmark_types=("strips-typed" "strips-automatic" "strips" "strips-round1")
index_folder=0
index_file=1

# Function to configure and set up the output directories
function configuration() {
    echo "### Remove and create output folders"
    echo
    for ((index_folder=0; index_folder < ${#benchmarks[@]}; index_folder++)); do
        echo "# ${benchmarks[$index_folder]} output folder"
        rm -rf "${benchmarks[$index_folder]}"
        mkdir "${benchmarks[$index_folder]}"
    done
    echo
    echo "### Compile SAT classes"
    javac -d classes -cp lib/*  src/*.java
    echo "## Done"
    echo
    echo "### Configuration successful"
    echo
}

# Function to run all benchmarks using the SAT planner
function run_benchmarks() {
    for ((index_folder=0; index_folder < ${#benchmarks[@]}; index_folder++)); do
        # Construct the path for current benchmark
        echo "Find the number of PDDL problems in the folder:"
        complete_path="$path/${ipc_folders[$index_folder]}/${benchmarks[$index_folder]}/${benchmark_types[$index_folder]}"
        pushd "$complete_path" > /dev/null
        pddl_files=($(printf "%s " p*.pddl))
        popd > /dev/null
        # Execute SAT planifications
        local nbfiles=${#pddl_files[@]}
        echo "### Execute $nbfiles SAT planifications on ${benchmarks[$index_folder]}"
        echo
        for ((index_file=0; index_file < nbfiles; index_file++)); do
            problem_name=${pddl_files[$index_file]}
            # Solve using SAT Planner
            solveSAT
        done
        echo
    done
}

# Function to run the SAT Planner for a specific problem
function solveSAT() {
    echo "# Plan ${problem_name}"
    timeout $COMMANDTIMEOUT \
        java -Xmx${XM} -cp classes:lib/* \
            SATPlanner \
            "${complete_path}/${domain_name}.pddl" \
            "${complete_path}/${problem_name}" \
        | grep -v 'WARNING' \
        > "${benchmarks[$index_folder]}/${benchmarks[$index_folder]}_$((${index_file}+1)).txt"
}


# Run the configuration and benchmark functions
configuration
run_benchmarks
exit 0
