require 'dm-core'
require 'dm-migrations'
DataMapper.setup(:default, ENV['DATABASE_URL'] || 'postgres://nefo:nefo@localhost/untikudb')

class Untiku
  include DataMapper::Resource
  property :id, Serial
  property :untiku, String
  property :create_at, DateTime
  auto_upgrade!
end
