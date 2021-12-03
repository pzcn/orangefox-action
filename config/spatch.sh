export OF_SKIP_DECRYPTED_ADOPTED_STORAGE=1

#hide decrypt page
sed -i "s/gui_startPage(\"decrypt\", 1, 1)/0/g" bootable/recovery/twrp.cpp
sed -i "s/\"OTA_decrypted\", \"1\"/\"OTA_decrypted\", \"0\"/g" bootable/recovery/twrp.cpp
sed -i "s/\"used_custom_encryption\", \"1\"/\"used_custom_encryption\", \"0\"/g" bootable/recovery/twrp.cpp
