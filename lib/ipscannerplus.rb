#!/usr/bin/env ruby

# file: ipscannerplus.rb

require 'ipscanner'
require 'fast_port_scanner'


PORTS = "
1 TCP Port Service Multiplexer  (TCPMUX)
2 CompressNET Management Utility
3 CompressNET Compression Process
4 Unassigned
5 Remote job entry
6 Unassigned
7 Echo Protocol
8 Unassigned
9 Discard Protocol
10 Unassigned
11 Active Users (systat service)
12 Unassigned
13 Daytime Protocol  ( RFC 867 )
14 Unassigned
16 Unassigned
17 Quote Of The Day
18 Message Send Protocol
19 Character Generator Protocol
20 FTP  data transfer
21 FTP  control (command)
22 Secure Shell  (SSH), secure logins,  file transfers  ( scp ,  sftp ) and port forwarding
23 Telnet  protocol—unencrypted text communications
24 Priv-mail, any private  mail  system
25 Simple Mail Transfer Protocol  (SMTP), used for e-mail routing between mail servers
26 Unassigned
27 NSW User System FE
29 MSG ICP
33 Display Support Protocol
35 Any private  printer server  protocol
37 Time Protocol
39 Resource Location Protocol (RLP)—used for determining the location of higher level  services  from  hosts  on a  network
40 Unassigned
42 Host Name Server Protocol
43 WHOIS  protocol
47 NI FTP
49 TACACS+  Login Host protocol
50 Remote Mail Checking Protocol
51 IMP Logical Address Maintenance
52 XNS ( Xerox Network Systems ) Time Protocol
53 Domain Name System  (DNS)
54 Xerox Network Systems  (XNS) clearinghouse
55 ISI Graphics Language (ISI-GL)
56 Xerox Network Systems  (XNS) authentication
58 Xerox Network Systems  (XNS) Mail
64 CI ( Travelport ) (formerly Covia) Comms Integrator
67 Bootstrap Protocol  (BOOTP) server; also used by  Dynamic Host Configuration Protocol  (DHCP)
68 Bootstrap Protocol  (BOOTP) client; also used by  Dynamic Host Configuration Protocol  (DHCP)
69 Trivial File Transfer Protocol  (TFTP)
70 Gopher  protocol
71–74 NETRJS  protocol
77 Any private Remote job entry
79 Finger protocol
80 Hypertext Transfer Protocol  (HTTP)
88 Kerberos  authentication system
90 dnsix ( DoD  Network Security for Information Exchange) Security Attribute Token Map
101 NIC   host name
102 ISO  Transport Service Access Point ( TSAP ) Class 0 protocol;  also used by  Digital Equipment Corporation   DECnet  (Phase V+) over TCP/IP
104 ACR / NEMA   Digital Imaging and Communications in Medicine  (DICOM)
105 CCSO Nameserver Protocol (Qi/Ph)
107 Remote Telnet Service protocol
108 SNA  Gateway Access Server
109 Post Office Protocol  v2 (POP2)
110 Post Office Protocol  v3 (POP3)
111 ONC RPC  ( Sun   RPC )
113 Ident , authentication service/identification protocol, used by  IRC  servers to identify users
115 Simple File Transfer Protocol
117 UUCP   Path Service
118 Structured Query Language ( SQL ) Services
119 Network News Transfer Protocol  (NNTP), retrieval of newsgroup messages
123 Network Time Protocol  (NTP), used for time synchronization
126 Formerly  Unisys  Unitary Login, renamed by Unisys to NXEdit. Used by Unisys Programmer's Workbench for Clearpath MCP, an IDE for  Unisys MCP software development
135 DCE   endpoint  resolution
137 NetBIOS  Name Service
138 NetBIOS  Datagram Service
139 NetBIOS  Session Service
143 Internet Message Access Protocol  (IMAP), management of email messages
152 Background File Transfer Program (BFTP)
153 Simple Gateway Monitoring Protocol  (SGMP)
156 SQL  Service
161 Simple Network Management Protocol  (SNMP)
162 Simple Network Management Protocol  Trap (SNMPTRAP)
170 Print-srv, Network  PostScript
175 VMNET (IBM z/VM, z/OS & z/VSE—Network Job Entry (NJE))
177 X Display Manager  Control Protocol (XDMCP)
179 Border Gateway Protocol  (BGP)
194 Internet Relay Chat  (IRC)
199 SMUX ,  SNMP  Unix Multiplexer
201 AppleTalk  Routing Maintenance
209 Quick Mail Transfer Protocol
210 ANSI   Z39.50
213 Internetwork Packet Exchange  (IPX)
218 Message posting protocol  (MPP)
220 Internet Message Access Protocol  (IMAP), version 3
262 Arcisdms
264 Border Gateway Multicast Protocol  (BGMP)
280 http-mgmt
308 Novastor Online Backup
311 Mac OS X Server  Admin (officially  AppleShare  IP Web administration)
318 PKIX  Time Stamp Protocol  (TSP)
319 Precision Time Protocol  (PTP) event messages
320 Precision Time Protocol  (PTP) general messages
350 Mapping of Airline Traffic over Internet Protocol  (MATIP) type A
351 MATIP type B
356 cloanto-net-1 (used by Cloanto Amiga Explorer and VMs)
369 Rpc2portmap
370 codaauth2, Coda authentication server
371 ClearCase albd
383 HP data alarm manager
384 A Remote Network Server System
387 AURP ( AppleTalk  Update-based Routing Protocol)
389 Lightweight Directory Access Protocol  (LDAP)
399 Digital Equipment Corporation   DECnet  (Phase V+) over TCP/IP
401 Uninterruptible power supply  (UPS)
427 Service Location Protocol  (SLP)
433 NNSP, part of  Network News Transfer Protocol
434 Mobile IP  Agent ( RFC 5944 )
443 Hypertext Transfer Protocol  over  TLS / SSL  ( HTTPS )
444 Simple Network Paging Protocol  (SNPP),  RFC 1568
445 Microsoft-DS  Active Directory , Windows shares
464 Kerberos  Change/Set password
465 URL Rendezvous Directory for SSM (Cisco protocol)
475 tcpnethaspsrv,  Aladdin Knowledge Systems  Hasp services
497 Dantz Retrospect
500 Internet Security Association and Key Management Protocol  (ISAKMP) /  Internet Key Exchange  (IKE)
502 Modbus  Protocol
504 Citadel , multiservice protocol for dedicated clients for the Citadel groupware system
510 FirstClass Protocol (FCP), used by  FirstClass  client/server groupware system
512 Rexec , Remote Process Execution
513 rlogin
514 Remote Shell , used to execute non-interactive commands on a remote system (Remote Shell, rsh, remsh)
515 Line Printer Daemon  (LPD), print service
517 Talk
518 NTalk
520 efs, extended file name server
521 Routing Information Protocol Next Generation  (RIPng)
524 NetWare Core Protocol  (NCP) is used for a variety things such as access to primary NetWare server resources, Time Synchronization, etc.
525 Timed,  Timeserver
530 Remote procedure call  (RPC)
532 netnews
533 netwall, For Emergency Broadcasts
540 Unix-to-Unix Copy Protocol ( UUCP )
542 commerce  (Commerce Applications)
543 klogin,  Kerberos  login
544 kshell,  Kerberos  Remote shell
548 Apple Filing Protocol  (AFP) over  TCP
550 new-rwho, new-who
554 Real Time Streaming Protocol  (RTSP)
560 rmonitor, Remote Monitor
561 monitor
563 NNTP  over  TLS / SSL  (NNTPS)
587 e-mail message submission   ( SMTP )
591 FileMaker  6.0 (and later) Web Sharing (HTTP Alternate, also see port 80)
593 HTTP RPC Ep Map,  Remote procedure call  over  Hypertext Transfer Protocol , often used by  Distributed Component Object Model  services and  Microsoft Exchange Server
601 Reliable  Syslog  Service — used for system logging
604 TUNNEL profile,   a protocol for  BEEP   peers  to form an  application layer   tunnel
623 ASF Remote Management and Control Protocol (ASF-RMCP)
631 Internet Printing Protocol  (IPP)
635 RLZ DBase
636 Lightweight Directory Access Protocol  over  TLS / SSL  (LDAPS)
639 MSDP,  Multicast Source Discovery Protocol
641 SupportSoft Nexus Remote Command (control/listening), a proxy gateway connecting remote control traffic
643 SANity
646 Label Distribution Protocol  (LDP), a routing protocol used in  MPLS  networks
647 DHCP Failover  protocol
648 Registry Registrar Protocol (RRP)
651 IEEE-MMS
653 SupportSoft Nexus Remote Command (data), a proxy gateway connecting remote control traffic
654 Media Management System (MMS) Media Management Protocol (MMP)
657 IBM  RMC (Remote monitoring and Control) protocol, used by  System p5   AIX  Integrated Virtualization Manager (IVM) and  Hardware Management Console  to connect managed  logical partitions (LPAR)  to enable dynamic partition reconfiguration
660 Mac OS X Server  administration
666 Doom , first online  first-person shooter
674 Application Configuration Access Protocol  (ACAP)
688 REALM-RUSD (ApplianceWare Server Appliance Management Protocol)
690 Velneo Application Transfer Protocol (VATP)
691 MS   Exchange  Routing
694 Linux-HA  high-availability heartbeat
695 IEEE  Media Management System over  SSL  (IEEE-MMS-SSL)
698 Optimized Link State Routing  (OLSR)
700 Extensible Provisioning Protocol  (EPP), a protocol for communication between  domain name registries  and  registrars  ( RFC 5734 )
701 Link Management Protocol (LMP),  a protocol that runs between a pair of  nodes  and is used to manage  traffic engineering  (TE)  links
702 IRIS   (Internet Registry Information Service) over  BEEP  (Blocks Extensible Exchange Protocol)  ( RFC 3983 )
706 Secure Internet Live Conferencing  (SILC)
711 Cisco  Tag Distribution Protocol —being replaced by the MPLS  Label Distribution Protocol
712 Topology Broadcast based on Reverse-Path Forwarding routing protocol  (TBRPF;  RFC 3684 )
749 Kerberos (protocol)  administration
750 kerberos-iv,  Kerberos  version IV
754 tell send
800 mdbs-daemon
830 NETCONF  over  SSH
831 NETCONF  over  BEEP
832 NETCONF  for  SOAP  over  HTTPS
833 NETCONF  for  SOAP  over  BEEP
847 DHCP Failover  protocol
848 Group Domain Of Interpretation (GDOI) protocol
853 DNS  over  TLS  ( RFC 7858 )
860 iSCSI  ( RFC 3720 )
861 OWAMP control ( RFC 4656 )
862 TWAMP control ( RFC 5357 )
873 rsync  file synchronization protocol
902 ideafarm-door (IdeaFarm (tm) Operations)
903 ideafarm-panic (IdeaFarm (tm) Operations)
989 FTPS  Protocol (data),  FTP  over  TLS / SSL
990 FTPS  Protocol (control),  FTP  over  TLS / SSL
991 Netnews  Administration System (NAS)
992 Telnet  protocol over  TLS / SSL
993 Internet Message Access Protocol  over  TLS / SSL  (IMAPS)
994 Internet Relay Chat  over  TLS / SSL  (IRCS)
995 Post Office Protocol  3 over  TLS / SSL  (POP3S)
1023 Reserved
"

# above info from https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers via 
#   http://a0.jamesrobertson.eu/dynarex/ports-wellknown.xml

class IPScannerPlus
  using ColouredText
  
  attr_reader :result

  def initialize(devices: nil, ports: nil)
    
    @custom_ports = ports.strip.lines.map do |x| 
      (x.chomp.split(/ +/,2) + ['']).take(2)
    end.to_h
    
    @known_ports = PORTS.strip.lines.map {|x| x.chomp.split(/ +/,2)}.to_h
    
    @devices = devices.strip.lines.map do |x| 
      a = x.chomp.split(/ +/,3)
      [a[0], a[1..2]]
    end.to_h
    
    @ports = @known_ports.merge(@custom_ports)
    
  end
  
  def lookup(service: nil, port: nil)
    
    if service then
      @result.find {|x| x.last.find {|y| y.last =~ /#{service}/i}} 
    elsif port 
      @result.find {|x| x.last.find {|y| y.first == port.to_i}}
    end
    
  end

  def scan()
    
    @result = IPScanner.scan.map do |ip| 
      
      ports = FastPortScanner.scan(ip, ports: (1..1000).to_a \
                                   + @custom_ports.keys.map(&:to_i))
      
      [
        [ip, @devices[ip[/\d+$/]]], 
         ports.map { |port| [port, @ports[port.to_s]] }
      ]
      
    end

  end
  
  def to_s()
    
    lines = @result.map do |line|

      rawheader, body = *line

      #header = "" % rawheader.join(' ')
      header = [
        rawheader[0].green,
        rawheader[1].to_a[0].to_s.length > 1 ? rawheader[1][0].brown.bold : '',
        rawheader[1] ? rawheader[1][1] : ''
      ].join(' ')

      head = if header.length > 75 then
        header[0..72] + '...'
      else
        header
      end

      head + "\n\n" + body.map do |x|
        desc = x[1].to_s.length > 38 ? (x[1][0..34] + '...') : x[1]
        colour = (x[0].to_i < 1024) ? :gray : :cyan
        "   %+14s %s" % [x[0].to_s.send(colour), desc]
      end.join("\n") + "\n"

    end

    lines.length.to_s + ' devices found' + "\n\n" + lines.join("\n")    
    
  end
  
end
