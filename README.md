MessagePack JSON-RPC Client for Ruby

Basic support for RPC Calls in this initial version, more will follow later.
JSON-RPC 2.0 specification, but payload is encoded using MessagePack

Gemfile (source ---> http://www.rubygems.org/ )
```ruby
gem "messagepack-jsonrpc-ruby"
```

Usage:

```ruby
client = MessagePack::JSONRPC::HTTPClient.new("http://localhost:5993/rpc")
client.remote_call("my_remote_method", param1: "hello")
=> { test_response: 'hi' }
```
