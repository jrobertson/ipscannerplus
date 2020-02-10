#!/usr/bin/env ruby

# file: ipscannerplus.rb

require 'ipscanner'
require 'fast_port_scanner'


PORTS = "
21 FTP
22 SSH
25 SMTP
53 DNS
80 HTTP
443 HTTPS
110 POP3
111 ONC RPC
119 NNTP
139 NetBIOS Session Service
445 Microsoft-DS (Directory Services) SMB file sharing
"


class IPScannerPlus
  
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
end

