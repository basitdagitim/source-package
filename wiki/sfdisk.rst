sfdisk Nedir
============

sfdisk, Linux işletim sistemlerinde disk bölümlerini yönetmek için kullanılan bir komuttur. Disk bölümlerini oluşturmak, düzenlemek, silmek veya görüntülemek için sfdisk'i kullanabilirsiniz.



Disk bölümlerini görüntüleme:
++++++++++++++++++++++++++++++

Diskinizdeki mevcut bölümleri görüntülemek için sfdisk komutunu kullanabilirsiniz. Aşağıdaki komutu kullanarak mevcut bölümleri listeleyebilirsiniz:

sfdisk -l /dev/sda

Disk bölümleri oluşturma:
+++++++++++++++++++++++++

Yeni bir disk bölümü oluşturmak için sfdisk komutunu kullanabilirsiniz. Örneğin, /dev/sda üzerinde yeni bir bölüm oluşturmak için aşağıdaki komutu kullanabilirsiniz:

echo ",,L" | sfdisk /dev/sda

Bu komut, kullanılabilir tüm alanı kullanarak bir bölüm oluşturacaktır.

Disk bölümlerini silme:
+++++++++++++++++++++++

Bir disk bölümünü silmek için sfdisk komutunu kullanabilirsiniz. Örneğin, /dev/sda üzerindeki bir bölümü silmek için aşağıdaki komutu kullanabilirsiniz:

echo ",,L" | sfdisk --delete /dev/sda

Bu komut, belirtilen bölümü silecektir.

sfdisk komutunun daha fazla seçeneği ve kullanımı vardır. Daha fazla bilgi için sfdisk komutunun man sayfasını inceleyebilirsiniz:

Bazı Örnekler
++++++++++++++

Örnek1:
-------

sfdisk /dev/sdf <<EOF
 0,512
 ,512
 ;
 EOF

/dev/sdf1 0+ 511 512- 4112639+ 83 Linux
/dev/sdf2 512 1023 512 4112640 83 Linux
/dev/sdf3 1024 1043 20 160650 83 Linux

 
Örnek2:
-------

sfdisk /dev/vda << EOF
label: dos
label-id: 0xaaaaaaaa
# comment:
start=, size= 50M,  type= 7 , bootable
start=, size= 650M, type= 27
start=, size= 45G , type= 7
EOF

Örnek3:
-------

Bu örnekte ilk bölüm 1GB ve ikinci bölüm ise diskin geri kalan kısmıdır.
echo -e "label: gpt\n,1GiB\n," | sudo sfdisk /dev/vda
veya
sfdisk /dev/vda << EOF
label: gpt
,1GiB
,
EOF


Örnek4:
-------

my.layout
# partition table of /dev/sda
unit: sectors

/dev/sda1 : start=     2048, size=   497664, Id=83, bootable
/dev/sda2 : start=   501758, size=1953021954, Id= 5
/dev/sda3 : start=        0, size=        0, Id= 0
/dev/sda4 : start=        0, size=        0, Id= 0
/dev/sda5 : start=   501760, size=1953021952, Id=8e

Aynı disk bölümlemesini ve düzenini başka bir aygıta uygulamak için:

sfdisk /dev/sdb < my.layout 
