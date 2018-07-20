require 'rubygems'
require 'json'
require 'pp'
require 'twitter'
require "dotenv"
Dotenv.load

# pour Watir
require 'watir' # Crawler
require 'pry' # Ruby REPL
require 'rb-readline' # Ruby IRB
require 'awesome_print' # Console output



class TownhallsFollowerWatir

  def jsonscrap
    json = File.read('../../db/townhalls.json')
    obj = JSON.parse(json)
    return obj
  end

  def tweeter(message)
    client = Twitter::REST::Client.new do |config|
			config.consumer_key        = ENV["TWITTER_API_KEY"]
			config.consumer_secret     = ENV["TWITTER_API_SECRET"]
			config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
			config.access_token_secret = ENV["TWITTER_ACCESS_SECRET"]
  end
    client.update(message)
  end

  def recuperer_compte_tweeter_de_la_mairie_de(mairie, browser)
    browser.input(:class => "search-input").click
    text = "mairie #{mairie}"
    browser.input(:class => "search-input focus".split).send_keys "#{text}", [:control, "a"], :backspace
    sleep(1)
    twittermairie = browser.span(:class => "username u-dir".split).text
    browser.input(:class => "search-input focus".split).send_keys :delete
    return twittermairie
  end

  def recuperer_compte_tweeter_des_mairies
    my_hash = jsonscrap
    array_de_comptes_twitter = []
    browser = Watir::Browser.new :firefox
    sleep(1)
    browser.goto "https://twitter.com/?lang=fr"
    username =  "0664631289"
    password = "sl220497"
    puts "Logging in..."
    browser.input(:name => "session[username_or_email]").click
    browser.input(:name => "session[username_or_email]").send_keys "#{username}", [:control, "a"], :backspace
    sleep(1)
    browser.input(:name => "session[password]").click
    browser.input(:name => "session[password]").send_keys "#{password}", [:control, "a"], :backspace
    sleep(1)
    browser.input(:class => "EdgeButton EdgeButton--secondary EdgeButton--medium submit js-submit".split).click
    sleep(1)
    my_hash.each do |key, value|
      mairie = key.downcase
      twittermairie = recuperer_compte_tweeter_de_la_mairie_de(mairie, browser).to_s
      array_de_comptes_twitter << twittermairie
      puts twittermairie
      tweeter("#{twittermairie} TheHackingProject bientôt dans votre ville ?") if twittermairie != ""
    end
    return array_de_comptes_twitter
  end


end


