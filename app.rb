require 'sinatra'
require 'json'

get '/' do
    "Hello, world"
end

get '/untiku.json' do
  JSON.generate({'untiku' => ['hoge', 'huga', 'hago']})
end
