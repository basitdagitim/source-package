#!/bin/bash


moduller()
{
for directory in ${@};
    	do
    	data=$(/sbin/modprobe --show-depends ${directory}|cut -d'/' -f8)
    	datas=$(echo $data | tr " " "\n")
    	bs=0
	    	for item in ${datas[@]}
	    	do
	    	
	    	#echo $item
	    	find /lib/modules/$(uname -r)/kernel/ -type f  -name "${item}"\
        -exec install {} ./mdl \;

	    	done
	    	
	    	
	done
}

#moduller {cdrom,loop,md,ahci}
moduller {cdrom,loop,md,ahci,block,ata,firewire,sd,scsi,message,pcmcia,virtio,host}
moduller {storage,crypto,fs,lib,dm-snapshot,overlay,isofs,squashfs,hfsplus,sr_mod,dm_mod}
moduller {nls,nls_utf8,overlayfs,udf,ext4,usb-storage}

cp /lib/modules/$(uname -r)/kernel/* -rf ./mdl/ #sistemden kopyalandı..

