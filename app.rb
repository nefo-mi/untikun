# -*- encoding: utf-8 -*-
require 'sinatra'
require 'json'
require './untiku.rb'
include Rack::Utils

helpers do
  include Rack::Utils
  alias_method :h, :escape_html
end

get '/' do
  set :erb, :escape_html => true, :format => :html5
  @untikus = get_untiku
  erb :index
end

get '/untiku_test.json' do
  untikus = Untiku.all.map {|untiku| untiku.untiku}
  JSON.generate({'untiku' => untikus})
end

get '/untiku.json' do
  JSON.generate({'untiku' => get_untiku})
end

post '/' do
  untiku = Untiku.new(:untiku => params[:untiku].strip.chomp, :create_at => Time.now)
  if untiku.save
    status 200
    redirect '/'
  else
    status 412
    redirect '/'
  end
end

private
def get_untiku
  Untiku.all.map {|untiku| untiku.untiku} 
end

def get_untiku_old
  [
    "便器に白が多いのは、どんな家にも合わせやすいから",
    "日本人が１年間に使用するトイレットペーパーを地球に巻きつけると、地球１万周分になる",
    "烏樞沙摩（うすさま）明王という神様の加護を得られると、他人にシモの世話にならないで済むらしい",
    "国武将のトイレは、敵襲にあっても応戦ようだだっ広いものだったらしい。",
    "猫の爪の雑菌がヤバい",
    "うさぎは植物、昔は鳥扱い",
    "日本でトイレを意味する言葉は、およそ５０種類以上ある",
    "トイレットペーパーの質は国によって違う",
    "うさぎはトイレの場所を覚える",
    "初期のNASAでは、宇宙飛行士はおむつを履いていたらしい"
  ]
end
