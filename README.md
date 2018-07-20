# Présentation

## Equipe

David Belaga - Simon Lembeye - Morgane Portal - Bastien Willet


## Synopsis

Le programme ultimate_townhall vogue sur internet à la recherche des adresses e-mail des mairies des départements de la Haute-Savoie, du Bas-Rhin et du Haut-Rhin. Il se charge d'adresser à chacune des mairies un e-mail de présentation de The Hacking Project. Il sait aussi relancer ces mairies par Twitter pour être bien certain de les avoir spammées à fond.


## Comment lancer le programme ?

1. A la racine du dossier ultimate_townhall, créez un ficher .env qui comprend les informations de vos comptes Gmail et Twitter Apps :

```
	GMAIL_USERNAME = "nom_utilisateur_Gmail"
	GMAIL_PASSWORD = "mot_de_passe_Gmail"
	SURNAME = "votre_prénom"

	TWITTER_API_KEY="votre_API_Key"
	TWITTER_API_SECRET="votre_API_Secret"
	TWITTER_ACCESS_TOKEN="votre_Access_Token"
	TWITTER_ACCESS_SECRET="votre_Access_Token_Secret"
```

2. Positionner le terminal à la racine du dossier ultimate_townhall
3. Lancer l'installation des gems : $ bundle install
4. Lancer le programme : $ ruby app.rb



# Fonctionnement

## Arborescence

```
ultimate_townhall
├── .gitignore
├── README.md
├── Gemfile
├── Gemfile.lock
├── app.rb
├── db
│   ├── townhalls.csv
│   └── townhalls.json
└── lib
    ├── app
    │   ├── townhalls_adder_to_db.rb
    │   ├── townhalls_follower.rb
    │   ├── townhalls_mailer.rb
    │   └── townhalls_scrapper.rb
    └── views
        ├── done.rb
        └── index.rb
```

## Fonction de chaque programme

- townhalls_scrapper.rb : scrappe le site http://annuaire-des-mairies.com/ à la recherche des adresse des mairies
- townhalls_adder_to_db.rb : Créée des fichiers .json ET .csv sur la base du scrapping
- townhalls_mailer.rb : envoie les e-mails à toutes les mairies sur la base du fichier .json
- townhalls_follower.rb : rajouter le handle twitter des mairies  aux fichiers .json ET .csv et follow les mairies sur tweeter

- index.rb : menu de départ du programme
- done.rb : réinitialisation du programme



## Gems ruby utilisées

- rubygems
- nokogiri
- open-uri
- json
- csv
- dotenv
- gmail
- twitter
- watir
- rubocop


# Résultats

## Compte twitter utilisé

- Nom : Coding improves you
- Handle : @Codewillchange1

## Nombre de mairies touchées

On a arreté de spammer par mail quand on a vu que le code fonctionnait :). Le bot twitter a trouvé 21 handles de mairies et les followe pour toujours et à jamais.
