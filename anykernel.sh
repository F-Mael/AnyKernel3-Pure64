# AnyKernel3 Ramdisk Mod Script
# Osm0sis @ xda-developers

properties() {
cat << PROPERTIES
kernel.string=Rodin KSU Next by Mael
do.devicecheck=0
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
supported.versions=14-16
PROPERTIES
}

# ⚠️ GKI FIX: Forzamos la partición boot
block=/dev/block/by-name/boot
is_slot_device=1
ramdisk_compression=auto

. tools/ak3-core.sh

# ⚠️ GKI FIX: Usamos split_boot porque no hay ramdisk en boot.img
split_boot
# ⚠️ GKI FIX: Usamos flash_boot para reempaquetar correctamente
flash_boot