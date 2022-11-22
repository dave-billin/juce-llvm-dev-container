# JUCE LLVM Dev Container

A vscode dev container configuration for developing JUCE applications using the LLVM toolchain.

## Description

This repository provides a vscode dev container configuration to simplify application development
using the LLVM toolchain and the [JUCE framework](https://juce.com/).  Simple GUI and plugin
applications copied from JUCE example sources are provided.  The dev container configuration assumes
a host Linux environment with an X-windows server and PulseAudio.  From the container it is possible
to run a GUI application and access audio inputs and outputs.

## Getting Started

### Dependencies

A Linux host environment (e.g. Ubuntu or similar variant) with:

* An X server (or [suitable setup in WSL2 under Windows](https://learn.microsoft.com/en-us/windows/wsl/tutorials/gui-apps))
* [PulseAudio](https://www.freedesktop.org/wiki/Software/PulseAudio/)
* [Docker](https://docs.docker.com/desktop/install/linux-install/)
* [Visual Studio Code](https://code.visualstudio.com/) with the
  [Remote Development Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)

### Building The Dev Container

* Open Visual Studio Code in the base directory of this repository.
* When prompted in vscode (or after pressing `Ctrl+Shift+P`), select "Reopen in Container".  Then,
  relax for a few minutes while the dev container image is built (NOTE: this long image build
  normally only occurs the first time the dev container is opened).

### Running The Dev Container

Once the dev container image is built and Visual Studio Code re-opens, the vscode environment is
ready to build the code.  Example GUI and (stand-alone) plugin apps are provided in the GUI and
plugin directories respectively.  These examples were copied directly from the [CMake examples
supplied with the JUCE library](https://github.com/juce-framework/JUCE/tree/master/examples/CMake).

Build tasks (defined in [.vscode/tasks.json](./.vscode/tasks.json)) are provided that automate
common steps to configure and build the example projects.  These can be accessed in Visual Studio
Code by pressing `Ctrl+Shift+B`.  These tasks configure and build code in the repository under a
`build/` subdirectory created in the repository root.  They include:

| Build Task | Description |
|:-----------|:------------|
| Build all examples   | Configures CMake and builds all examples |
| Configure CMake      | Configures the build using CMake |
| Build JUCE stand-alone plugin example | Builds the stand-alone plugin example |
| Build JUCE GUI example | Builds the GUI example |
| Delete build directory | Deletes the `build/` directory (useful for ensuring a clean build) |

Additionally, the following tasks are defined in [.vscode/tasks.json](./.vscode/tasks.json) for
running the example projects.  These can be accessed by pressing `Ctrl+Shift+P`, typing/selecting
the *Tasks: Run Task* option, then clicking on the task to run:

| Task | Description |
|:-----------|:------------|
| Run GUI example                | Runs the GUI example executable |
| Run stand-alone plugin example | Runs the stand-alone plugin example executable |

## Authors

Dave Billin

## Version History

* 0.1
  * Initial pre-release

## License

This project is licensed under the [NAME HERE] License - see the LICENSE.md file for details

## Acknowledgments

The following websites provided useful background and examples for creating the JUCE dev container

* [Ayal Amir's JUCE project template](https://github.com/eyalamirmusic/JUCECmakeRepoPrototype)
* [Audio in Docker containers, Linux audio subsystems, Spotifyd](https://joonas.fi/2020/12/audio-in-docker-containers-linux-audio-subsystems-spotifyd/)
* [An Introduction to Modern CMake](https://cliutils.gitlab.io/modern-cmake/)
* [Sudara's blog on building JUCE with CMake](https://melatonin.dev/blog/how-to-use-cmake-with-juce/)
* [Vscode Dev Container Metadata Reference](https://containers.dev/implementors/json_reference/)
* [The JUCE Library Tutorials](https://juce.com/learn/tutorials)
