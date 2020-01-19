<div align="center">

# Burn Notice

New machine, got let go, or got burned? Remove the most used data from your computer with one command.

[![Build Status](https://travis-ci.org/Justintime50/burn-notice.svg?branch=master)](https://travis-ci.org/Justintime50/burn-notice)
[![MIT Licence](https://badges.frapsoft.com/os/mit/mit.svg?v=103)](https://opensource.org/licenses/mit-license.php)

<img src="assets/showcase.png">

</div>

## Usage

Burn Notice will remove potentially sensitive data as well as the majority of items from your home folder excluding apps. 

### This includes:

- .ssh
- .zshrc/.bash_profile and .bash_history/.bash_sessions
- Other .config files/folders that may include keys, secrets, etc housed in the root of your home folder
- Desktop, Documents, Downloads, Movies, Pictures, Music

### This does not include:

- Anything in the `Applications` folder
- Anything stored outside your personal home folder
- This does not sign you out of iCloud
- This does not remove browser data

### Command

```bash
./burn-me.sh
```

You can also create an alias to have this script readily available if the need arose:

```bash
echo 'alias burn-me="/path/to/burn-me.sh"' >> ~/.zshrc
source ~/.zshrc
```

## Gotchas

- Burn Notice is not intended to be a 100% secure solution to destroying data, there are better methods to use instead such as formatting your hard drive.
- Burn Notice is not intended to render your machine unusable. It will only remove the contents of your main home folder files and various hidden files that may contain sensitive data.
