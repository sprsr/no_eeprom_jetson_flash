# I retried flashing this with virtual box, and the USB baud rate is problematic. 
# I had success flashing this with Ubuntu 20
# on Bare Metal, and in VMWare. 
# For some reason I think that USB is limited 
# in Virtual Box. 
#
# Also, Remember that you should update the user 
# specific values such as 
# <username>, <password>, and <hostname>
# Also, I have not tested later ubuntu releases
# Such as 23.  Use Ubuntu 20 if possible.
sudo apt update
sudo apt -y upgrade

sudo apt install -y qemu-user-static nano ssh
cd ~
tar xpf Downloads/Jetson_Linux_R35.3.1_aarch64.tbz2
sudo tar xpf Downloads/Tegra_Linux_Sample-Root-Filesystem_R35.3.1_aarch64.tbz2 \
  -C Linux_for_Tegra/rootfs/
sed -i 's/cvb_eeprom_read_size = <0x100>/cvb_eeprom_read_size = <0x0>/g' Linux_for_Tegra/bootloader/t186ref/BCT/tegra234-mb2-bct-misc-p3767-0000.dts
cd Linux_for_Tegra/
sudo ./apply_binaries.sh
sudo ./tools/l4t_flash_prerequisites.sh
sudo ./tools/l4t_create_default_user.sh -u <username> -p <password> -a -n <hostname>
sudo ./tools/kernel_flash/l4t_initrd_flash.sh --external-device nvme0n1p1 \
  -c tools/kernel_flash/flash_l4t_external.xml -p "-c bootloader/t186ref/cfg/flash_t234_qspi.xml" \
  --showlogs --network usb0 jetson-orin-nano-devkit internal
