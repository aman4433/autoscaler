#!/bin/bash

# Copyright 2025 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -o errexit
set -o nounset
set -o pipefail

SCRIPT_ROOT=$(realpath $(dirname "${BASH_SOURCE[0]}"))/..
TARGET_FILE="${SCRIPT_ROOT}/docs/flags.md"
COMPONENTS=("admission-controller" "recommender" "updater")
DEFAULT_TAG="1.3.1"

# Function to extract flags from a binary
extract_flags() {
    local binary=$1
    local component=$2
    
    if [ ! -f "$binary" ]; then
        echo "Error: Binary not found for ${component} at ${binary}"
        return 1
    fi
    
    echo "# What are the parameters to VPA ${component}?"
    echo "This document is auto-generated from the flag definitions in the VPA ${component} code."
    echo
    echo "| Flag | Default | Description |"
    echo "|---------|---------|-------------|"

$binary --help 2>&1 | awk '
  BEGIN {
    FS=""
    print "| Flag | Default | Description |"
    print "|------|---------|-------------|"
  }
  
  /^[ \t]*--?[^ =]+/ {
    if (flag != "") {
      print_flag()
    }
    flag = ""
    default_val = ""
    desc = ""
    
    # Extract flag
    match($0, /--?[^ =]+/)
    flag = substr($0, RSTART+2, RLENGTH-2)
    
    # Extract default
    if (match($0, /\(default:?[^\)]*\)/)) {
      default_val = substr($0, RSTART+9, RLENGTH-10)
    }
    
    # Extract description after flag and default
    desc_start = RSTART + RLENGTH
    desc = substr($0, RLENGTH + index($0, flag) + 3)
    
    # Save line indentation for continuation lines
    indent = ""
    if (match($0, /^[ \t]+/)) {
      indent = substr($0, RSTART, RLENGTH)
    }
    
    next
  }
  
  /^[ \t]+/ {
    # continuation of description, keep indentation
    desc = desc "\n" $0
    next
  }
  
  function print_flag() {
    # Remove leading/trailing whitespace from desc
    gsub(/^[ \t]+/, "", desc)
    gsub(/[ \t]+$/, "", desc)
    
    # Escape pipe | chars in desc for markdown table safety
    gsub(/\|/, "\\|", desc)
    
    printf("| `%s` | %s | %s |\n", flag, default_val, desc)
  }
  
  END {
    if (flag != "") {
      print_flag()
    }
  }
'

}
# Build components
pushd "${SCRIPT_ROOT}" >/dev/null
for component in "${COMPONENTS[@]}"; do
    echo "Building ${component}..."
    pushd "pkg/${component}" >/dev/null
    if ! go build -o ${component} ; then
        echo "Error: Failed to build ${component}"
        popd >/dev/null
        continue
    fi
    popd >/dev/null
done
popd >/dev/null

# Generate combined flags documentation
echo "Generating flags documentation..."
{
    echo "# Vertical Pod Autoscaler Flags"
    echo "This document contains the flags for all VPA components."
    echo
    echo "To view the most recent _release_ of flags for all VPA components, consult the release tag [flags($DEFAULT_TAG)](https://github.com/kubernetes/autoscaler/blob/vertical-pod-autoscaler-$DEFAULT_TAG/vertical-pod-autoscaler/docs/flags.md) documentation."
    echo
    echo "> **Note:** This document is auto-generated from the default branch (master) of the VPA repository."
    echo

    for component in "${COMPONENTS[@]}"; do
        binary="${SCRIPT_ROOT}/pkg/${component}/${component}"
        if ! extract_flags "$binary" "$component" ; then
            echo "Error: Failed to extract flags for ${component}"
        fi
    done
} > "${TARGET_FILE}"

echo "VPA flags documentation has been generated in ${TARGET_FILE}"
