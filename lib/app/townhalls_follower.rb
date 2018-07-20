class TownhallsFollower
	def initialize

		file = File.read("db/townhalls.json")
		datas = JSON.parse(file)


		Dotenv.load

		client = Twitter::REST::Client.new do |config|
			config.consumer_key        = ENV["TWITTER_API_KEY"]
			config.consumer_secret     = ENV["TWITTER_API_SECRET"]
			config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
			config.access_token_secret = ENV["TWITTER_ACCESS_SECRET"]
		end

		datas_handles = {}

		datas.each do |mairie, value|
			handle = client.user_search("@#{mairie}").first
			datas_handles[mairie] = value
			if handle != nil
				if handle.name.match("#{mairie.capitalize}") && handle.name.match("Ville") || handle.name.match("#{mairie.capitalize}") && handle.name.match("Commune") || handle.name.match("#{mairie.capitalize}") && handle.name.match("Mairie") || handle.name.match("#{mairie.capitalize}") && handle.name.match("Agglo") || handle.name.match("#{mairie.capitalize}") && handle.name.match("ville") || handle.name.match("#{mairie.capitalize}") && handle.name.match("commune") || handle.name.match("#{mairie.capitalize}") && handle.name.match("mairie") || handle.name.match("#{mairie.capitalize}") && handle.name.match("agglo") || handle.name.match("#{mairie.capitalize}") == mairie.capitalize || handle.name.match("#{mairie.downcase}") && handle.name.match("Ville") || handle.name.match("#{mairie.downcase}") && handle.name.match("Commune") || handle.name.match("#{mairie.downcase}") && handle.name.match("Mairie") || handle.name.match("#{mairie.downcase}") && handle.name.match("Agglo") || handle.name.match("#{mairie.downcase}") && handle.name.match("ville") || handle.name.match("#{mairie.downcase}") && handle.name.match("commune") || handle.name.match("#{mairie.downcase}") && handle.name.match("mairie") || handle.name.match("#{mairie.downcase}") && handle.name.match("agglo") || handle.name.match("#{mairie.downcase}") == mairie.downcase
					client.follow(handle.id)
					datas_handles[mairie] << handle.id.to_s
				else
					datas_handles[mairie] << ""
				end
				puts datas_handles[mairie].inspect
			end
		end
		File.open("db/townhalls.json","w") do |f|
    		f.write(JSON.pretty_generate(datas_handles))
  		end
		CSV.open("db/townhalls.csv", "w") do |csv|
    		values = JSON.parse(File.open("db/townhalls.json").read).values
    		keys = JSON.parse(File.open("db/townhalls.json").read).keys
    		for i in 0...keys.size
      			csv << [keys[i],values[i][0],values[i][1],values[i][2]]
    		end
  		end
	end
end



