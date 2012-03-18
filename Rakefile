require 'dm-core'
require 'dm-migrations'
require './untiku.rb'

task 'db:migrate' do
  DataMapper.setup(:default, ENV['DATABASE_URL'] || 'postgres://nefo:nefo@localhost/untikudb')
  DataMapper.auto_upgrade!
  self
end
