#! /bin/sh

# gr-osmosdr install script for debian based systems

GR_VER=$(apt list gnuradio 2>/dev/null | grep -m 1 gnuradio | cut -d' ' -f2 | cut -d'.' -f1,2)
echo "Identified GNURadio version ${GR_VER}"
if [ ${GR_VER} = "3.8" ]; then
    echo "Installing for GNURadio 3.8"
else
    echo "Installing for GNURadio ${GR_VER} is not supported by this version of op25"
    echo "Please use git branch \"master\" for GNURadio-3.10 or later"
    exit 1
fi

GR_OSMOSDR=$(apt list gr-osmosdr 2>/dev/null | grep -o '\[.**\]')
echo "Checking for gr-osmosdr package ${GR_OSMOSDR}"
if [ "${GR_OSMOSDR}" != "" ]; then
    echo "The gr-osmosdr package is presently installed."
    echo "Please remove it before running this install script."
    exit 1
fi

rm -rf build
mkdir build
cd build
echo "Configuring..."
cmake ../         2>&1 | tee cmake.log
echo "Compiling..."
make              2>&1 | tee make.log
echo "Installing..."
sudo make install 2>&1 | tee install.log
sudo ldconfig
echo "...installation complete"

