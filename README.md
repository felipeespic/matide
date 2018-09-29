# Matide
-----------------------------------------------------

Python IDE solution for signal/image processing **or any field that requires heavy interaction with plots and debugging.**

![matide](https://user-images.githubusercontent.com/16511990/35426115-7b684f38-0258-11e8-999c-49f7e7ea8422.png)

**Matide** is basically a guide (plus some scripts) to install and use a set of 3rd party tools, which if used together behave like an awesome Python IDE that:

* Is light weight.
* Resembles **MATLAB's** workflow.
* Plots interactively 1D, 2D, and 3D, in execution and debugging mode.
* Supports autocomplete in text editor and console.
* Easily sends code from the text editor to the console.
* Supports breakpoints.


## Motivation

As a signal processing scientist, I used to use **MATLAB** to prototype my algorithms until I discovered the benefits of using Python. So, I searched for good Python IDEs, but each failed to fulfil my requirements in some way. I have been using this set of tools for a long time, and I have not found anything better for my needs, so I decided to share this guide with the community.

## Installation
As mentioned, rather than an actual IDE fully contained in one package, it is just a collection of tools, which are installed separately. I use **GNU/Linux**, but it should work for MacOSx similarly.

### I. Download
Download **Matide** master directory and move it to its _definitive_ location in your PC. After install and configuration, you will not be able to move this directory without breaking **Matide**.

### II. Python packages
Install the following list of Python packages:
* ipython
* ipdb
* jedi
* gnureadline
* numpy
* matplotlib
* pyflakes
* pep8

I recommend installing them by using the command: ```pip install --upgrade <package>```
### III. Sublime Text
We will use SublimeText as the default text editor. To install it, just follow the instructions (and check its licencing) from its [official website](https://www.sublimetext.com/3).

### IV. Sublime Text plug-ins ("packages"):
1. We need to install the "Package Control" (Sublime Text package manager), which will enable the installation of Sublime Text packages (plug-ins). Just follow the installing instructions from its [download webpage](https://packagecontrol.io/installation).

2. Add the package __PythonBreakpoints2__ repository to Sublime Text:
   1. From Sublime Text, press ```ctrl+shift+p (Win, Linux)``` or ```cmd+shift+p (OS X)``` to open the palette.
   2. Input in the palette: **_Package Control: Add Repository_**
   3. Input in the field that appeared at the bottom: **_https://<i></i>github.com/felipeespic/PythonBreakpoints2_**


3. Install the following set of Sublime Text packages:
   * SendCode
   * Anaconda (don't get confused with the Python package)
   * PythonBreakpoints2 (before we just installed the repository)
   * Trailing Spaces

   To install them, follow the next steps per package:
   1. From Sublime Text, press ```ctrl+shift+p (Win, Linux)``` or ```cmd+shift+p (OS X)``` to open the palette.
   2. Input in the palette: **_Package Control: Install Package_**
   3. Search by typing the package name, and enter to install.


### V. Some extra applications:
We need some extra applications as well. So, install:
* Gnome Terminal or Guake.
* Tmux

(e.g., in Ubuntu they can be installed by ```sudo apt install <application>```)

### VI. Configuration

Run the script ```./install/configure.sh```. It essentially configures Sublime Text and its packages previously installed.


## Usage

Run the script ```./matide <existing working directory>``` or ```./matide``` (your current directory will be taken as the working directory). It will open a terminal and the text editor for you.

Then, you can create Python scripts in Sublime Text to start coding.

Basic actions:
* Send code from the text editor to console: ```F9```
* Add breakpoint: ```ctrl+shift+B```
* Switch focus between console and text editor: ```alt+tab```
* Autocomplete in console and text editor: ```tab```
* Interactive plotting: Type in console ```plot(array_1d)```, ```plotm(array_2d)```, or ```surf(array_2d)```

Advanced:
* You can add your own interactive built-in functions (e.g.,```plotm()```), by modifying the IPython startup file ```./startup/profile_default/startup/startup.py```
* Install another Python packages, such as **SciPy**, **Scikit-learn**, etc., by e.g., ```pip install <package>```

## Contributing
The community and me will be very thankful if you can help to this project by:
* Testing this guide and scripts in different platforms.
* Proposing modifications to this guide to support MacOSx and Windows out of the box.
* Proposing or asking for enhancements.
* Proposing an implementation for the **variable explorer**, which is not included in the current version.
Any of these can be discussed in the **Issues** section. You can create a personal fork, and then send a pull request.

## FAQ

- **Q:** It just works with gnome-terminal, but not with Guake.

    **A:** Comment the "For gnome-terminal" lines and uncomment the "For Guake" lines at the end of the ```./matide``` script.

- **Q:** How do I return to my original Sublime-Text configuration?

    **A:** Your can restore your original Sublime-Text config file which is stored in ```~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings_backup```.






