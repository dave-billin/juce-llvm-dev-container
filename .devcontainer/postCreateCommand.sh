#!/bin/env bash
#-------------------------------------------------------------------------------
# DESCRIPTION:
#   This script executes commands following creation of the dev container
#
# PARAMETERS:
#   -j,--juce-version VERSION
#       Set the JUCE source tree to the branch/commit/tag given in VERSION
#-------------------------------------------------------------------------------

#=====================================
# Parse command line arguments
#=====================================

# Canonicalize script arguments using getopt
short_opts="j:"
long_opts="juce-version:"
parsed_opts=$(getopt -n "${0}" --options "${short_opts}" --long "${long_opts}" -- "${@}")
eval set -- "${parsed_opts}"

JUCE_LIBRARY_VERSION=
while true;
do
   OPTION=${1}
   [[ "${#}" -ge 2 ]] && OPTARG=${2}

   case "${OPTION}" in
      # OPTIONAL PARAMETERS
      -j|--juce-version) JUCE_LIBRARY_VERSION=${OPTARG}; shift;;
      --) shift; break;;
      *) echo "Unrecognized option: ${OPTION}"
         exit 1;;
   esac
   shift
done

# Set the branch/commit/tag in the JUCE library source tree
git submodule update --init --recursive
(cd ThirdParty/JUCE && git checkout ${JUCE_LIBRARY_VERSION})
