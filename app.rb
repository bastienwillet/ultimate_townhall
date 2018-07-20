require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'app/townhalls_scrapper.rb'
require 'app/townhalls_adder_to_db.rb'
require 'app/townhalls_mailer.rb'
require 'app/townhalls_follower.rb'
require 'views/index.rb'
require 'views/done.rb'

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'
require 'csv'
require 'dotenv'
require 'gmail'
require 'twitter'
require 'watir'
require 'rubocop'

index = Index.new