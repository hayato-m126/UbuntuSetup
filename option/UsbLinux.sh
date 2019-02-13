if [ $# -ne 3 ]; then
  echo "usage: ./UsbLinux.sh efi_partition_drive_letter linux_root_partition_number UUID"
  echo "ex) ./UsbLinux.sh b1 2 F1AE-8882"
  exit 1
fi

sudo apt -y install grub-efi-amd64-bin
grub-mkimage -d /usr/lib/grub/x86_64-efi/ -o BOOTx64.EFI -O x86_64-efi -p "" part_gpt part_msdos ntfs ntfscomp hfsplus fat ext2 normal chain boot configfile linux multiboot
mkdir efi
sudo mount /dev/sd$1 efi
mkdir -p efi/EFI/BOOT
cp BOOTx64.EFI efi/EFI/BOOT/
cp -r /usr/lib/grub/x86_64-efi efi/EFI/BOOT/
echo "configfile (hd0,msdos$2)/boot/grub/grub.cfg" > efi/EFI/BOOT/grub.cfg
sudo umount efi
rmdir efi

echo "UUID=$3   /boot/efi  vfat    defaults    0   1" | sudo tee -a /etc/fstab


