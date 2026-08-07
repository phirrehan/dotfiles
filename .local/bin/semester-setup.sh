#!/bin/bash

# made with AI

# ----------- Argument Handling -----------
# If no argument is provided, use current directory
semDir="${1:-$(pwd)}"

# ----------- User Inputs -----------
read -p "Enter Semester Number: " semNum
read -p "Enter Total Subjects: " totSubj
read -p "Enter number of subjects with lab: " labCount

# ----------- Validation -----------
if ((labCount > totSubj)); then
  echo "Error: Number of lab subjects ($labCount) cannot exceed total subjects ($totSubj)."
  exit 1
fi

# ----------- Create Semester Directory -----------
semesterPath="$semDir/semester $semNum"
mkdir -p "$semesterPath"

# ----------- Create Subject Directories -----------
for ((i = 1; i <= totSubj; i++)); do

  # First labCount subjects will have labs
  if ((i <= labCount)); then
    subjectDir="$semesterPath/subject $i has lab"
    hasLab=true
  else
    subjectDir="$semesterPath/subject $i"
    hasLab=false
  fi

  # Create subject directory
  mkdir -p "$subjectDir"

  # Create common subdirectories
  mkdir -p "$subjectDir/books"
  mkdir -p "$subjectDir/cdf"
  mkdir -p "$subjectDir/assignments"

  # Create lab directory only if subject has lab
  if $hasLab; then
    mkdir -p "$subjectDir/lab-assignments"
  fi
done

echo "Directory structure created successfully at: $semesterPath"
