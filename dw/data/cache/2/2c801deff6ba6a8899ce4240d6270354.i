a:46:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:52:"http://blog.ipspace.net/2014/10/lag-versus-ecmp.html";i:1;s:15:"LAG VERSUS ECMP";}i:2;i:1;}i:3;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:73;}i:4;a:3:{i:0;s:9:"linebreak";i:1;a:0:{}i:2;i:74;}i:5;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:"
";}i:2;i:77;}i:6;a:3:{i:0;s:6:"plugin";i:1;a:4:{i:0;s:13:"wrap_spanwrap";i:1;a:2:{i:0;i:1;i:1;s:5:"<wrap";}i:2;i:1;i:3;s:6:"<wrap>";}i:2;i:78;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:3086:"
By Ivan Pepelnjak Click here to subscribe to my SDN mailing list


Monday, October 06, 2014

Bryan sent me an interesting question:

When you have the opportunity to use LAG or ECMP, what are some things you should consider?
He already gathered some ideas (thank you!) and I expanded his list and added a few comments.

Purpose: resiliency or more bandwidth? For resiliency you want fast failure detection and the ability to connect to multiple uplink devices, for more bandwidth, you want better hashing.

Failure detection: LAG uses LACP to detect link failures, and assuming your LAG implementation supports fast LACP timers, you can detect link failures in three seconds. ECMP uses routing protocol hello mechanisms (which you can tune to sub-second convergence) or BFD.

Scalability: Adding more IP links might increase the size of the OSPF link state database (or not, if you use IPv6 link local addresses or OSPF knobs that don’t propagate transit subnets in router LSAs).

ECMP usually increases the size of the IP routing table and forwarding tables, which might cause problems in some data center switches with pretty low IPv4 and IPv6 forwarding tables. Some vendors might be smart enough to use next-hop groups (available in most switching silicon these days) for ECMP purposes; not sure whether anyone does – please do write a comment if you know more.

On the other hand, you might get multiple ARP entries for a single IP adjacency (toward a router or a host) over a LAG in forwarding architectures that include outgoing physical interface in the ARP entry. In these scenarios you might run out of ARP/ND entries.

Load balancing algorithm: usually not an issue. Platforms that support 5-tuple load balancing across a LAG usually support it over ECMP and vice versa. There might be exceptions that drove you mad – write a comment and list the offenders.

Redundant designs: It’s trivial to implement a design connecting an edge (leaf) switch to two core (spine) switches with ECMP. Doing the same thing with LAG involves MLAG, which is always proprietary (because there’s no MLAG standard) and somewhat clumsy.

Using more than two spine switches in a layer-2-only fabric forces you to use TRILL/SPB or any number of proprietary layer-2 fabric solutions (example: FabricPath, VCS Fabric…). I'd rather stay with ECMP; it's been working for the last 20 years.

Anything else? Write a comment!

More information

Speaking of leafs and spines – you’ll find numerous L2/L3 designs in my Leaf-and-Spine Fabric Architectures webinar. Worried about forwarding table sizes of popular data center switches? Check out the Data Center Fabric Architectures webinar (or get access to both of them and dozens more with the subscription). We can also discuss your design and implementation challenges in an ExpertExpress session.

Tags: IP routing, Link aggregation Email ThisBlogThis!Share to TwitterShare to Facebook
RELATED POSTS BY CATEGORIES



17 COMMENTS:


Ofer06 October, 2014 10:09
Hi Ivan,

- LAG has means to utilise BFD. draft-mmm-bfd-on-lags is one of them";}i:2;i:84;}i:8;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:3:"...";}i:2;i:3170;}i:9;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1022:"
- LAG has some finer control over its members with things like setting a threshold of active members before failing the whole bundle (AKA minimum-links)
- LAG work across same-speed members (1g/10g/etc) whereas ECMP doesn't have this requirement
- in more general note. LAG w/ LACP is stateful (from the LAG POV, not the the member POV). ECMP is stateless in this sense. hence, adding/removing links from a LAG is communicated to the other end.
ReplyDelete
Replies

Ivan Pepelnjak06 October, 2014 12:47
Hi Ofer,

* BFD-over-LAG: any implementations you're aware of out there?

* ECMP over non equal-speed members - don't do it unless you're absolutely sure about what you're doing and why (not to mention that you'd need to tweak routing protocol metrics to get it to work).

* You could also claim that ECMP is stateful - after all, the addition/removal of links is signaled through routing protocols ;)

Delete

WildSubnet06 October, 2014 17:14
Juniper calls it micro-bfd and it is supported starting with Junos 13.3.

";}i:2;i:3173;}i:10;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:93:"http://www.juniper.net/documentation/en_US/junos13.3/topics/concept/bfd-for-lag-overview.html";i:1;N;}i:2;i:4195;}i:11;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:67:"

Delete

Walter De Smedt14 October, 2014 19:42
- Alcatel-Lucent's ";}i:2;i:4288;}i:12;a:3:{i:0;s:14:"multiplyentity";i:1;a:2:{i:0;s:1:"7";i:1;s:2:"50";}i:2;i:4355;}i:13;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:362:" routers have BFD for LAG since last year (11.0R5)
- multi-speed LAG is also supported since this year, mixing 10/100GE in a single lag, there is no need for tweaking routing protocols. the 100GE links just get a 'weight' x10 in the hashing algorithm. Useful if you want to grow expensive BW granularly
- LAG vs. ECMP: next to the obvious IGP scaling issue with ";}i:2;i:4359;}i:14;a:3:{i:0;s:13:"emphasis_open";i:1;a:0:{}i:2;i:4721;}i:15;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:272:" IP links,LAG supports fate-sharing between member-links using port-thresholds (LAG fails if min nr of member-links fail) - useful to avoid congestion. Not trivial with ECMP over IP links

Delete
Reply

Anonymous06 October, 2014 13:26
LAG failure detection:
1. There is a ";}i:2;i:4723;}i:16;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"RFC";}i:2;i:4995;}i:17;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:4998;}i:18;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:34:"http://tools.ietf.org/html/rfc7130";i:1;N;}i:2;i:4999;}i:19;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:116:" BFD for LAG.
2. As i understand, Cisco Nexus can implement BFD for LAG. IOS will create BFD session for each link. ";}i:2;i:5033;}i:20;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:226:"http://www.cisco.com/c/en/us/td/docs/switches/datacenter/nexus5500/sw/interfaces/6x/b_5500_Interfaces_Config_Guide_Release_6x/b_5500_Interfaces_Config_Guide_Release_6x_chapter_0110.html#concept_0B1573CB2DE248338D6EF32C62FC904D";i:1;N;}i:2;i:5149;}i:21;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:195:"
3. Also, you can configure Single-hop BFD session and associate it with interface status.

Load balance:
The main problem is to load balance fat L2VPN in service provider network.
1. There is a ";}i:2;i:5375;}i:22;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:5570;}i:23;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:72:"Flow-Aware Transport of Pseudowires over an MPLS Packet Switched Network";}i:2;i:5571;}i:24;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:5643;}i:25;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:33:" rfc6391 for ECMP
2. And for LAG ";}i:2;i:5644;}i:26;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:5677;}i:27;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:44:"The Use of Entropy Labels in MPLS Forwarding";}i:2;i:5678;}i:28;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:5722;}i:29;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:58:" rfc6790 can be used. 
3. Also, some high-end devices can ";}i:2;i:5723;}i:30;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:5781;}i:31;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:4:"look";}i:2;i:5782;}i:32;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:5786;}i:33;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1017:" inside L2VPN and load-balance traffic using customer SMAC/DMAC/SIP/DIP for LAG load-balancing.

P.S. Price for 100GE interfaces getting lower each year :)

ReplyDelete

Bhargav06 October, 2014 16:06
ECMP provides better control of traffic than LAG. For example, it is easy to implement TE using say PBR with ECMP than with LAG.

ReplyDelete

Steven iveson06 October, 2014 22:22
I wonder, using either, does the hashing/balancing adjust if one link becomes 100% utilised and the other has spare capacity?

ReplyDelete
Replies

Ivan Pepelnjak07 October, 2014 07:58
That would be ideal, but I don't think many switches do that.

Delete

reggle07 October, 2014 07:59
I haven't encountered any product that will. Hashing is done in hardware so software doesn't actively look at it.

Delete

Anonymous07 October, 2014 14:45
Will not this move a flow from one link to another and hence packet re-order ?

Delete

Ivan Pepelnjak07 October, 2014 15:37
You have to be careful - move the flow bucket when it's idle (search for ";}i:2;i:5787;}i:34;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:6804;}i:35;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:8:"flowlets";}i:2;i:6805;}i:36;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:6813;}i:37;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:178:" for more details).

Delete

Anonymous08 October, 2014 11:40
Juniper's MX routers implement adaptive load balancing for LAGs based on periodic monitoring of load on LAG members:
";}i:2;i:6814;}i:38;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:104:"http://www.juniper.net/documentation/en_US/junos13.3/topics/concept/load-balance-technique-overview.html";i:1;N;}i:2;i:6992;}i:39;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:977:"

Packet re-ordering is an issue only if it is persistent. Protocols and applications are typically resilient to an occasional reordered packet.

Delete
Reply

Johannes07 October, 2014 09:00
Under failure detection I would also mention, that there are direct link failures as well (and I guess these are more common). Then BFD routing protocol timers or (fast) LACP are not relevant any more.

ReplyDelete

Anonymous07 October, 2014 09:51
Hi - 

How about ECMP using layer-3 LAGs ? Does that provide the most options for failure detection?

Thanks,

ReplyDelete

Will Hogan14 October, 2014 08:20
I prefer ECMP over lag. So much easier to configure a lag than 1000 ecmp links.

ReplyDelete

DuaneO17 October, 2014 17:17
We needed to include SRLG to get ECMP to the same ~feature set as LAG (w XR fast LACP hellos or per member bfd).

ReplyDelete

Nedsky30 September, 2015 18:10
considering qos (llq, cbwfq, wred) - is it easier on LAG or ECMP?

ReplyDelete
Add comment
Load more";}i:2;i:7096;}i:40;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:3:"...";}i:2;i:8073;}i:41;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:82:"
You don't have to log in to post a comment, but please do provide your real name/";}i:2;i:8076;}i:42;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"URL";}i:2;i:8158;}i:43;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:48:". Anonymous comments might get deleted.

</wrap>";}i:2;i:8161;}i:44;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8161;}i:45;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:8161;}}