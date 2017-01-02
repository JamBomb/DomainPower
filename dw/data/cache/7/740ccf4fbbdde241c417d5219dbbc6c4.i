a:36:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:19:"config_pure_jericho";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:20;}i:4;a:3:{i:0;s:2:"hr";i:1;a:0:{}i:2;i:20;}i:5;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:20;}i:6;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:52:"1、在console下，重启板卡，等待出现Type ";}i:2;i:34;}i:7;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:86;}i:8;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:5:"uboot";}i:2;i:87;}i:9;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:92;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:125:" to stop autoboot:输入uboot进入到uboot，再输入run applinux系统进入linux shell 模式下，等待启动完成。 ";}i:2;i:93;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:218;}i:12;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:74:" FM1@DTSEC1, FM1@DTSEC2 
 Type "uboot" to stop autoboot: 
 => run applinux";}i:2;i:218;}i:13;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:218;}i:14;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:36:"2、在linux shell下建立软连接";}i:2;i:301;}i:15;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:337;}i:16;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:275:" osm4f_20_8#cd /usr/lib 
 mv libBcm.so libBcm.so.org 
 osm4f_20_8#mv libBcm.so libBcm.so.org 
 osm4f_20_8#ln -s /mnt/sdcard/lkk/libBcm.so.dbg libBcm.so
 osm4f_20_8#cd /usr/local/bin
 osm4f_20_8#rm -f HALServer.out
 osm4f_20_8#ln -s /mnt/sdcard/lkk/HALServer.out HALServer.out";}i:2;i:337;}i:17;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:337;}i:18;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:16:"3、运行脚本";}i:2;i:628;}i:19;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:644;}i:20;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:87:" osm4f_20_8#export APPMODE=APP
 osm4f_20_8#cd /usr/local/bin
 osm4f_20_8#./intfinit.sh ";}i:2;i:644;}i:21;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:644;}i:22;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:62:"4、gdb 启动HAL server, 等待出现(gdb) 增加调试断点";}i:2;i:739;}i:23;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:801;}i:24;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:889:" osm4f_20_8#dtach -c /tmp/dtach-HAL gdb HALServer.out
 GNU gdb (Wind River Linux Sourcery CodeBench 4.6a-99) 7.4.50.20120716-cvs
 Copyright (C) 2012 Free Software Foundation, Inc.
 License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
 This is free software: you are free to change and redistribute it.
 There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
 and "show warranty" for details.
 This GDB was configured as "powerpc-wrs-linux-gnu".
 For bug reporting instructions, please see:
 <support@windriver.com>...
 Reading symbols from /usr/local/bin/HALServer.out...done.
 (gdb) set print pretty on
 (gdb) set print object on
 (gdb) set print static-members on
 (gdb) set print vtbl on
 (gdb) set print demangle on
 (gdb) set demangle-style gnu-v3
 (gdb) set print sevenbit-strings off
 (gdb) set pagination off
 (gdb) set print elements 0";}i:2;i:801;}i:25;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:801;}i:26;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:40:"5、增加完断点后进行继续启动";}i:2;i:1732;}i:27;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1772;}i:28;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:35:" (gdb) run -noapp cold tcl -debug  ";}i:2;i:1772;}i:29;a:3:{i:0;s:2:"hr";i:1;a:0:{}i:2;i:1811;}i:30;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1811;}i:31;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:"have a good lucky ";}i:2;i:1828;}i:32;a:3:{i:0;s:6:"smiley";i:1;a:1:{i:0;s:3:";-)";}i:2;i:1846;}i:33;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:1849;}i:34;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1849;}i:35;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:1849;}}