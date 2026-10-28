Gem::Specification.new do |s|
  s.name        = 'tplink-cli'
  s.version     = '1.0.0'
  s.summary     = 'Universal TP-Link Router CLI & Network Optimization Suite'
  s.description = 'CLI tool for TP-Link 4G LTE gateways and broadband routers'
  s.authors     = ['Dulith Divisekara']
  s.email       = 'dulithdivisekara@gmail.com'
  s.homepage    = 'https://github.com/dulithdivisekara/tplink-cli'
  s.license     = 'MIT'
  s.files       = Dir['bin/*', 'tplink_cli/**/*', 'README.md', 'LICENSE']
  s.bindir      = 'bin'
  s.executables << 'tplink-cli'
end
