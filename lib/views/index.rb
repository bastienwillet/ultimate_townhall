class Index
	def initialize
		puts ""
		puts "Que veux tu faire ?"
		puts "1 : scrapper les mails des mairies du 67, du 68 et du 74"
		puts "2 : Faire péter les mails"
		puts "3 : Tweeter les mairies"
		print ">"
		choice = gets.chomp
			if choice == "1"
				puts ""
				puts "-- Please wait while scrapping --"
				TownhallsAdderToDB.new.remplir_json
				TownhallsAdderToDB.new.remplircsv
				puts ""
				puts "Le JSON et le CSV sont dispo dans le dossier db"
				puts ""
				puts "-- réinitialisation du programme --"
				done = Done.new
			elsif choice == "2"
				puts ""
				puts "-- Please wait while mailing --"
				Dotenv.load
				townhalls_mailer = TownhallsMailer.new(ENV["GMAIL_USERNAME"], ENV["GMAIL_PASSWORD"], ENV["SURNAME"])
				puts ""
				puts "La cargaison de mails a été délivrée"
				puts ""
				puts "-- réinitialisation du programme --"
				done = Done.new
			elsif choice == "3"
				puts ""
				puts "-- Please wait while dealing with twitter --"
				townhalls_follower = TownhallsFollower.new
				puts ""
				puts "C'est fait, tu as bien tweeté de ouf"
				puts ""
				puts "-- réinitialisation du programme --"
				done = Done.new
			else
				puts ""
				abort("Tu as choisis la pilule bleue. Ciao")
			end
	end
end