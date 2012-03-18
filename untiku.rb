require 'dm-core'
require 'dm-migrations'
require 'dm-validations'
require 'dm-validations-i18n'

DataMapper.setup(:default, ENV['DATABASE_URL'] || 'postgres://nefo:nefo@localhost/untikudb')
DataMapper::Validations::I18n.localize! 'ja'

class Untiku
  include DataMapper::Resource
  property :id, Serial
  property :untiku, String, :required => true, :unique => true, :length => 1..100
  property :create_at, DateTime
  auto_upgrade!
end
