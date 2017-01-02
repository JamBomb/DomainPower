a:12:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:40:"PMF: Create  Group and Entry in BCM cint";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:41;}i:4;a:3:{i:0;s:2:"hr";i:1;a:0:{}i:2;i:41;}i:5;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:1062:"
int unit = 0;
int group_priority = 1;
bcm_field_qset_t qset;
bcm_field_aset_t aset;
bcm_field_group_t grp = 1;
bcm_field_entry_t ent;

BCM_FIELD_QSET_INIT(qset);
BCM_FIELD_QSET_ADD(qset, bcmFieldQualifyStageIngress);
BCM_FIELD_QSET_ADD(qset, bcmFieldQualifyForwardingType);
BCM_FIELD_QSET_ADD(qset, bcmFieldQualifyTunnelType);
BCM_FIELD_QSET_ADD(qset, bcmFieldQualifyIpProtocolCommon);

BCM_FIELD_ASET_INIT(aset);
BCM_FIELD_ASET_ADD(aset, bcmFieldActionForwardingTypeNew);

print  bcm_field_group_create_id(unit, qset, group_priority, grp);
print  bcm_field_group_action_set(unit, grp, aset);

print  bcm_field_entry_create(unit, grp, &ent);
print  bcm_field_qualify_ForwardingType(unit, ent, bcmFieldForwardingTypeL3);
print  bcm_field_qualify_IpProtocolCommon(unit, ent, bcmFieldIpProtocolCommonIpInIp);
print  bcm_field_qualify_TunnelType(unit, ent, bcmFieldTunnelTypeIp);
print  bcm_field_action_add(unit, ent, bcmFieldActionForwardingTypeNew, bcmFieldForwardingTypeIp4Ucast, 3 );

print  bcm_field_group_install(unit, grp);
bcm_field_group_dump(0,1);

----";}i:2;i:48;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:48;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:"Have a good lucky ";}i:2;i:1172;}i:8;a:3:{i:0;s:6:"smiley";i:1;a:1:{i:0;s:5:"FIXME";}i:2;i:1190;}i:9;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:1195;}i:10;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1195;}i:11;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:1195;}}