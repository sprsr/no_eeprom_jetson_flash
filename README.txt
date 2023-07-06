ONLY USE THIS METHOD FOR JETSON ORIN NANO
THIS WILL NOT WORK FOR JETSON NANO, XAVIER, OR OTHER EARLIER JETSON MODULES. 

Using NVIDIA SDK MANAGER should work fine for all other modules. 

This Method is for flashing with no access to SD card.  Specific to flashing over device USB.  My specific case is in a Cluster Board that does not have an SD card slot, and no other IO besides NVME PCIE 2.0.  I wasted 5 hours trying to install via SDK Manager and this was finally the way I was able to get the jetson flashed. 

DISCLAIMER:  I have attempted flashing this way via Ubuntu 23 Virtual Box Unsuccessfully, Ubuntu 23 on VMWare Unsuccessfuly, Virtual Box on Ubuntu 20.04 unsuccessfully, VMWare on Ubuntu 20.04 successfully (With some troubleshooting involved) as well as on Ubuntu 20.04 on Bare Metal. (MOST SUCCESSFUL FOR ME).


DISCLAIMER:  DO NOT! Try to change your /etc/hosts file to use a static IP after this method if you are using Jetson headless (No Display, No Direct IO).  There must have been some issue with this, and I was not able to access via ssh with Static IP OR DHCP.  Had to completely restart the flashing process.
