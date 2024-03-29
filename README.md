<div align="center">

# Burn Notice

Returning a machine to IT, got let go, or got burned? Delete your data with one command.

[![Build](https://github.com/Justintime50/burn-notice/workflows/build/badge.svg)](https://github.com/Justintime50/burn-notice/actions)
[![Version](https://img.shields.io/github/v/tag/justintime50/burn-notice)](https://github.com/Justintime50/burn-notice/releases)
[![Licence](https://img.shields.io/github/license/justintime50/burn-notice)](LICENSE)

<img src="https://raw.githubusercontent.com/justintime50/assets/main/src/burn-notice/showcase.png" alt="Showcase">

</div>

Burn Notice will remove all files from your home directory, leaving folder structures intact.

## Disclaimer

**I take no responsibility for what you destroy. Run this script at your own risk.**

## What Gets Burned

### Notable Inclusions

This list is not exhaustive!

- `~/Applications`
- `~/Desktop`
- `~/Documents`
- `~/Downloads`
- `~/Movies`
- `~/Music`
- `~/Pictures`
- `.ssh`
- `.aws`
- `.zshrc` and `.bashrc`
- `.bash_history`
- `.bash_sessions`
- etc

### The Following Are Not Burned

- Anything stored outside your personal home folder (eg: root `/Applications` folder)
- Signing out or deleting things like iCloud, DropBox, Google Drive, or other cloud storage providers (it actively tries to ignore these)
- Browsing data
- Trash - [see why](https://www.imore.com/how-force-empty-trash-your-mac-using-terminal)
- `~/Library` - requires sudo access and is necessary for the user account to function

Burn notice runs as the user and does not require sudo access ensuring you can only burn what belongs to you.

## Install

```bash
# Setup the tap
brew tap justintime50/formulas

# Install the tool
brew install burn-notice
```

## Usage

Once invoked, Burn Notice will ask for confirmation and provide a warning before proceeding.

```bash
burn-notice
```

## Gotchas

- **Burn Notice is not intended to be a 100% secure solution to destroying data.** There are better methods to use instead such as formatting your hard drive. Burn Notice is the quick and dirty solution when you may not have time to format a drive.
- **Burn Notice is not intended to render your machine unusable or break the boot sequence.** It will only remove the contents of your main home folder files and various hidden files that may contain sensitive data.

### Destroy your Filesystem

If for whatever reason you really truly do want to destroy the filestructure of your system (don't), run the following:

```bash
rm -rf /*
```

**NOTE:** Some OS's won't allow you to run this, others may warn you before doing so, some may just blow away everything without awaiting your input. Use at your own risk.
