Forked from official Osmocom gr-osmosdr with additions to support HydraSDR

This version of gr-osmosdr is intended to replace libgnuradio-osmosdr.so, which
was likely to have already been installed from your OS distro's package repo.
Having two different versions of the same library installed on the same system
can lead to unexpected behavior and frustration as you try to figure out why your
applications aren't working.  Please uninstall the packaged library prior to
compiling and installing this one!  The install.sh script will try to prevent
conflicts by looking at the package management system ("apt") but it does
not guard against conflicts with other locally built code.

Prerequisits:
 * Fully installed gnuradio-3.8 or later
 * Use of correct version of code depending on gnuradio version:
   For gnuradio-3.10 or later, please "git checkout master" (this is the default).
   For gnuradio-3.8, please "git checkout gr38" before installing.
 * Drivers for SDR hardware already installed.  
   e.g. librtlsdr-dev, libairspy-def, libsoapysdr-dev, rfone-host
 * Developer built tools already installed.
   e.g. build-essential, boost, cmake, git, ...

Install process:
   cd ~
   git clone https://github.com/boatbod/gr-osmosdr
   cd ~/gr-osmosdr
   git checkout <master | gr38>            (this is an optional step)
   ./install.sh

Upon completion:
 * Check results in the three log files
   ~/gr-osmosdr/build/cmake.log            (right packages enabled?)
   ~/gr-osmosdr/build/make.log             (build completed successfully?)
   ~/gr-osmosdr/build/install.log          (installed properly?)

Uninstall:
 * It is possible to uninstall the driver as follows:
   cd ~/gr-osmosdr/build
   sudo make uninstall

