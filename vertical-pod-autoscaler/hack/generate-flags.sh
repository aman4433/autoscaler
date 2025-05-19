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

    local help_output
    help_output=$($binary --help 2>&1)

    local current_flag_name=""
    local current_flag_def=""
    local current_flag_desc=""
    local first_flag_processed=false

    # Function to output the currently accumulated flag
    output_current_flag() {
        if [[ -n "$current_flag_name" ]]; then
            current_flag_desc=$(echo "$current_flag_desc" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
            local md_desc
            md_desc=$(echo "$current_flag_desc" | sed ':a;N;$!ba;s/\n/<br \/>/g')
            echo "| \`--${current_flag_name}\` | ${current_flag_def:-} | ${md_desc} |"
        fi
    }

    while IFS= read -r line || [[ -n "$line" ]]; do
        if [[ -z "$line" && -z "$current_flag_name" ]]; then
            continue
        fi

        if [[ "$line" =~ ^[[:space:]]*- ]]; then
            if $first_flag_processed; then
                output_current_flag
            fi
            first_flag_processed=true

            current_flag_name=""
            current_flag_def=""
            current_flag_desc=""

            if [[ $line == *"-v, --v Level"* ]]; then
                current_flag_name="v"
                if [[ "$line" =~ default:[[:space:]]*([0-9]+) ]]; then
                    current_flag_def="${BASH_REMATCH[1]}"
                elif [[ "$line" =~ \(default[[:space:]]+([0-9]+)\) ]]; then
                    current_flag_def="${BASH_REMATCH[1]}"
                else
                    current_flag_def="0"
                fi
                current_flag_desc="Number for the log level verbosity."
            else
                current_flag_name=$(echo "$line" | awk '{print $1}' | sed 's/^-*//;s/=.*$//')

                if [[ "$line" =~ "\(default[[:space:]]+([^)]*)\)" ]]; then
                    current_flag_def="${BASH_REMATCH[1]}"
                else
                    current_flag_def=$(echo "$line" | sed -nE 's/.*default:[[:space:]]+("?[^")"]+"?).*/\1/p')
                fi

                current_flag_def=$(echo "$current_flag_def" | sed -e 's/^"//' -e 's/"$//' -e "s/^'//" -e "s/'$//")

                local desc_part
                desc_part=$(echo "$line" | sed -E 's/^[[:space:]]*-{1,2}[a-zA-Z0-9.-]+(=[^[:space:]]+)?([[:space:]]+[^[:space:]]+)?\s*//')
                desc_part=$(echo "$desc_part" | sed -E 's/\s*\((default[^)]*|default:[^)]*)\)//')
                desc_part=$(echo "$desc_part" | sed -E 's/\s*default:[[:space:]]+[^[:space:]]+//')
                current_flag_desc=$(echo "$desc_part" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
            fi
        else
            if [[ -n "$current_flag_name" ]]; then
                local trimmed_line
                trimmed_line=$(echo "$line" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
                if [[ -n "$trimmed_line" ]]; then
                    if [[ -z "$current_flag_desc" ]]; then
                        current_flag_desc="$trimmed_line"
                    else
                        current_flag_desc="${current_flag_desc}"$'\n'"${trimmed_line}"
                    fi
                elif [[ -n "$current_flag_desc" && ! "$current_flag_desc" =~ $'\n'$'\n'$ ]]; then
                    current_flag_desc="${current_flag_desc}"$'\n'
                fi
            fi
        fi
    done <<< "$help_output"

    output_current_flag
    echo
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
