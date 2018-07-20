class TownhallsAdderToDB

def remplir_json

  require_relative 'townhalls_scrapper'

  mairies = TownhallsScrapper.new.go
  puts mairies


  File.open("db/townhalls.json","w") do |f|
    f.write(JSON.pretty_generate(mairies))
  end
end


def remplircsv
  CSV.open("db/townhalls.csv", "w") do |csv|
    values = JSON.parse(File.open("db/townhalls.json").read).values
    keys = JSON.parse(File.open("db/townhalls.json").read).keys
    for i in 0...keys.size
      csv << [keys[i],values[i][0],values[i][1]]
    end
  end
end

end