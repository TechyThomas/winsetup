# TechyThomas Windows Setup Script

A custom script for setting up Windows how I like it and the common apps I always install and use.

*(Feel free to fork or clone and modify this script to suit your own needs)*

## Running

To run the script open Powershell as Administrator and run the following command:

```powershell
irm "https://setup.techythomas.com/win" | iex
```

*All files are served directly from this repo using GitHub raw urls.*

## Options

By default, the script will run through and install all apps and apply the preset configs. You can however choose which parts to run using commands. The following arguments are supported

| Argument |Operation  |
|--|--|
| -config | Apply the registry tweaks |
| -apps| Install apps |
| -wallpaper| Apply the wallpaper |

For example, to run only the configuration part:

```powershell
iex "& { $(irm 'https://setup.techythomas.com/win') } -config"
```

## Config

Below is a list of all registry and config tweaks made to Windows

 - **Taskbar:** Show taskbar labels unless full
 - **Taskbar:** Show taskbar labels on other monitors unless full
 - **Taskbar:** Show apps only on the screen they are on
 - **Taskbar:** Show seconds in the clock
 - **Taskbar:** Hide search from taskbar
 - **Taskbar:** Hide task view from taskbar
 - **Explorer:** Hide item check boxes
 - **Explorer:** Show hidden files
 - **Explorer:** Show file extensions
 - **Explorer:** Open "This PC" by default
 - **Settings:** Enable developer mode
 - **Settings:** Show "End Task" in taskbar
 - **Settings:** Enable dark mode for apps
 - **Settings:** Enable dark mode for system
 - **Settings:** Enable transparency
 - **Settings:** Disable accent colour on taskbar and windows
 - **Region:** Change short date format. e.g. 24 Sep 2024

Windows Explorer will be restarted once changes have been applied.

## Apps

Below is a list of all the apps installed to Windows using `winget`.

- Steam
- Discord
- Parsec (installed as a system service)
- Cursor IDE
- Visual Studio Code
- Git
- GitKraken
- Obsidian
- PowerToys
- NanaZip
- 1Password
- YouTube Music Desktop Player
- Office 365
- Foxit PDF Reader

## Wallpaper

Wallpapers will be downloaded from the following repository and set as a slideshow, changing every 30 mins in a random order.

https://github.com/ChrisTitusTech/nord-background

Shout out to Chris Titus for the awesome compilation of backgrounds.

*(Currently the backgrounds will only be downloaded to a directory in the user's Pictures folder. I'm still working on being able to set it to a slideshow)*