# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# Propiedades globales
properties() { '
kernel.string=KernelSU Next GKI para Poco X7 Pro (Rodin)
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=rodin
device.name2=2412DPC0AG
supported.versions=14.0-16.0
supported.patchlevels=
'; } # end properties

## Boot Shell Variables
# IMPORTANTE: Apuntar explícitamente a la partición 'boot' para GKI
block=boot;
is_slot_device=auto; # Detección automática de ranuras A/B
ramdisk_compression=auto;
patch_vbmeta_flag=auto; # Necesario para deshabilitar verificación AVB si se requiere

# Importar funciones y configurar parches
. tools/ak3-core.sh;

## Instalación del Kernel (Fase Crítica)
# Usar split_boot para evitar el error "No ramdisk found"
# split_boot extrae el kernel y el encabezado, ignorando la ausencia de ramdisk
split_boot;

# El archivo 'Image' en la raíz del ZIP reemplazará automáticamente al kernel extraído
# durante la fase de reempaquetado.

# Usar flash_boot para reempaquetar sin esperar un ramdisk y escribir en la partición
flash_boot;
## Fin de la instalación del boot

## Tratamiento de init_boot (Opcional para SUSFS)
# Si en el futuro se requiere habilitar SUSFS completo con hooks en ramdisk,
# se debe descomentar este bloque. Para el objetivo actual, se mantiene comentado.
# block=init_boot;
# reset_ak;
# dump_boot; # init_boot SÍ tiene ramdisk, así que dump_boot funciona aquí
# write_boot;