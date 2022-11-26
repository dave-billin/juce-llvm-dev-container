cmake_minimum_required(VERSION 3.16)

# Change this to the name of your plugin
# This cannot have spaces (but PRODUCT_NAME can)
set(PROJECT_NAME "Example JUCE Apps")

# Reads in VERSION file and sticks in it CURRENT_VERSION variable
# Be sure the file has no newlines
file(STRINGS VERSION CURRENT_VERSION)

# For simplicity, the name of the project is also the name of the target
project(${PROJECT_NAME} VERSION ${CURRENT_VERSION})

# Adds all the module sources so they appear correctly in the IDE
# Must be set before JUCE is added as a sub-dir (or any targets are made)
# https://github.com/juce-framework/JUCE/commit/6b1b4cf7f6b1008db44411f2c8887d71a3348889
set_property(GLOBAL PROPERTY USE_FOLDERS YES)

# Define the location of the directory where bundled ThirdParty libraries are located
set(THIRDPARTY_DIR "${CMAKE_CURRENT_SOURCE_DIR}/ThirdParty")

# Create a /Modules directory in the IDE with the JUCE Module code
option(JUCE_ENABLE_MODULE_SOURCE_GROUPS "Show all module sources in IDE projects" ON)

#-------------------------------
# Set up JUCE options
#-------------------------------
set(JUCE_BUILD_EXTRAS ON)   # Add targets to build the Projucer and other JUCE tools
set(JUCE_BUILD_EXAMPLES ON) # Enable building JUCE examples

# JUCE is setup as a submodule in the ThirdParty/JUCE folder
# Locally, you'll need to run `git submodule update --init --recursive` once
# and `git submodule update --remote --merge` to keep it up to date
# On Github Actions, it's managed by actions/checkout
add_subdirectory("${THIRDPARTY_DIR}/JUCE")
juce_set_vst2_sdk_path("") # "${THIRDPARTY_DIR}/vst3sdk") # Tell JUCE where to find the VST SDK

# Build the GUI example provided in this repo
add_subdirectory(GUI-example)

# Build the plugin example provided in this repo
add_subdirectory(audio-plugin-example)
