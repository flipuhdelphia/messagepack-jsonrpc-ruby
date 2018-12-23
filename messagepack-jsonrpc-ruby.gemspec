$LOAD_PATH.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "messagepack-jsonrpc-ruby"
  s.version     = "0.0.1"
  s.date        = "2018-12-23"
  s.summary     = "messagepack-jsonrpc-ruby"
  s.description = "Ruby Client to send and receive MessagePack-encoded RPC calls using JSON-RPC 2.0 spec"
  s.authors     = "Naman Mehta"
  s.email       = "namanm@gmail.com"
  s.files       = ["lib/messagepack/jsonrpc/http_client.rb"]
  s.homepage    = "http://rubygems.org/gems/messagepack-jsonrpc-ruby"
  s.license     = "MIT"

  s.add_runtime_dependency     "msgpack"
  s.add_runtime_dependency     "httparty"
  s.add_development_dependency "rspec"
end
