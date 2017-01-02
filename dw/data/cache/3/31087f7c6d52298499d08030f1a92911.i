a:20:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:11:"1. prepare:";}i:2;i:2;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:13;}i:4;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:151:" create softe links at root directory for vobs and env.sh (like below config)
   cd /
   ln -s /home/workspace/mTera5/vobs
   ln -s /home/workspace    ";}i:2;i:13;}i:5;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:13;}i:6;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:22:"2. compile enviroment:";}i:2;i:174;}i:7;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:196;}i:8;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:85:" cd /workspace
 source env.bash
 cd /vobs/ots/development
 csh
 source envqoriq50.csh";}i:2;i:196;}i:9;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:196;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:"3. compile line card:";}i:2;i:294;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:315;}i:12;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:49:" libs:
 cd /vobs/ots/development/proj/
 make libs";}i:2;i:315;}i:13;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:43:" osm2 image:
 cd /vobs/ots/osm2/proj/
 make";}i:2;i:372;}i:14;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:109:" osm4 image:
 cd /vobs/ots/osm4/proj/
 make
 
 osm4 HalServer:
 cd /vobs/ots/osm4/Apps/HalServer/proj 
 make ";}i:2;i:423;}i:15;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:423;}i:16;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:22:"4. compile BCM lib.so:";}i:2;i:549;}i:17;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:571;}i:18;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:364:"cd /vobs/ots/broadcom/BCM_SDK_6.4.11/sdk-all 
source env_tlabduneqoriq50.csh -u 
mkdir -p /vobs/ots/broadcom/BCM_SDK_6.4.11/sdk-all/build/linux/user/$platform 
cd /vobs/ots/broadcom/BCM_SDK_6.4.11/sdk-all/systems/linux/user/tlabduneqoriq50-2_6 
make bcm 
gmake bcm 
cd /vobs/ots/broadcom/BCM_SDK_6.4.11/sdk-all/systems/linux/user/tlabduneqoriq50-2_6 
gmake export ";}i:2;i:571;}i:19;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:571;}}