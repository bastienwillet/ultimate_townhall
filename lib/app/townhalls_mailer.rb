class TownhallsMailer
	def initialize(username, password, surname)
		gmail = Gmail.connect(username, password)

		file = File.read("db/townhalls.json")   					 # Remplacer par le JSON réel et supprimer le JSON de test
		datas = JSON.parse(file)

		datas.each do |key, value|

			email = gmail.compose do
				to value[1]
				subject "The Hacking Project"
				body "Bonjour,

Je m'appelle #{surname}, je suis élève à The Hacking Project, une formation au code gratuite, sans locaux, sans sélection, sans restriction géographique. La pédagogie de ntore école est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code. Le projet du jour est d'envoyer (avec du codage) des emails aux mairies pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation pour tous.

Déjà 500 personnes sont passées par The Hacking Project. Est-ce que la mairie de #{key} veut changer le monde avec nous ?


Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80"
			end
			email.deliver!
			puts "E-mail envoyé à la mairie de #{key}"
		end
		gmail.logout
	end
end