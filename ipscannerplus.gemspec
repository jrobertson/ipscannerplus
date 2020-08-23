Gem::Specification.new do |s|
  s.name = 'ipscannerplus'
  s.version = '0.3.0'
  s.summary = 'Helps find out what service is running where in the network.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/ipscannerplus.rb']
  s.add_runtime_dependency('ipscanner', '~> 0.3', '>=0.3.0')
  s.add_runtime_dependency('fast_port_scanner', '~> 0.1', '>=0.1.0')
  s.signing_key = '../privatekeys/ipscannerplus.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/ipscannerplus'
end
