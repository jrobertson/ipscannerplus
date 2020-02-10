# Introducing the ipscannerplus gem

## Usage

    require 'ipscannerplus'

    devices = "
    1 router VirginMedia SuperHub
    16 webcam front window
    "

    custom_ports = "
    59000 spsbroker
    "

    ipsp = IPScannerPlus.new devices: devices, ports: custom_ports
    ipsp.scan
    ipsp.lookup service: 'spsbroker'
    #=> [["192.168.4.173", nil], [[22, "SSH"], [59000, "spsbroker"]]] 
    a = ipsp.result 
    pp a

<pre>

[[["192.168.4.1", ["router", "VirginMedia SuperHub"]], [[80, "HTTP"]]],
 [["192.168.4.16", ["webcam", "front window"]], [[21, "FTP"], [80, "HTTP"]]],
 [["192.168.4.135", nil], [[22, "SSH"]]],
 [["192.168.4.158", nil],
  [[22, "SSH"],
   [25, "SMTP"],
   [53, "DNS"],
   [80, "HTTP"],
   [81, nil],
   [110, "POP3"],
   [119, "NNTP"],
   [143, nil],
   [443, "HTTPS"],
   [445, "Microsoft-DS (Directory Services) SMB file sharing"],
   [465, nil],
   [504, nil],
   [563, nil],
   [587, nil],
...
</pre>

## Resources

* ipscannerplus https://rubygems.org/gems/ipscannerplus

ipscanner ipscannerplus gem network scan ping echo ip port
