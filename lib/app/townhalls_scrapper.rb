class TownhallsScrapper

  def get_all_emails_of_haut_rhin(my_hash)
    departement = "68-Haut-Rhin"
    page_departement = Nokogiri::HTML(open("http://annuaire-des-mairies.com/haut-rhin.html"))
    scrapper_page(my_hash, page_departement, departement)
    page_departement = Nokogiri::HTML(open("http://annuaire-des-mairies.com/haut-rhin-2.html"))
    scrapper_page(my_hash, page_departement, departement)
    my_hash
  end

  def get_all_emails_of_haute_savoie(my_hash)
    departement = "74-Haute-Savoie"
    page_departement = Nokogiri::HTML(open("http://annuaire-des-mairies.com/haute-savoie.html"))
    scrapper_page(my_hash, page_departement, departement)
    page_departement = Nokogiri::HTML(open("http://annuaire-des-mairies.com/haute-savoie-2.html"))
    scrapper_page(my_hash, page_departement, departement)
    my_hash
  end

  def get_all_emails_of_bas_rhin(my_hash)
    departement = "67-Bas-Rhin"
    page_departement = Nokogiri::HTML(open("http://annuaire-des-mairies.com/bas-rhin.html"))
    scrapper_page(my_hash, page_departement, departement)
    page_departement = Nokogiri::HTML(open("http://annuaire-des-mairies.com/bas-rhin-2.html"))
    scrapper_page(my_hash, page_departement, departement)
    my_hash
  end

  def scrapper_page(my_hash, page_departement, departement)
    page_departement.css('.lientxt').each do |ville|
      adresse =  "http://annuaire-des-mairies.com"
      adresse += ville['href'].reverse.chop.reverse
      puts nom_ville = ville.text
      if nom_ville != "NANTES EN RATIER" && nom_ville != "VERNA" && nom_ville != "BRIZON" && nom_ville != "REIGNIER"
        page_ville = Nokogiri::HTML(open(adresse))
        puts email = page_ville.xpath('//html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
        my_hash[nom_ville.force_encoding("utf-8")] = [departement.force_encoding("utf-8"), email.force_encoding("utf-8")]
      end
    end
    my_hash
  end

  def go
    my_hash = Hash.new("")
    my_hash1 = get_all_emails_of_haut_rhin(my_hash)
    my_hash = Hash.new("")
    my_hash2 = get_all_emails_of_haute_savoie(my_hash)
    my_hash = Hash.new("")
    my_hash3 = get_all_emails_of_bas_rhin(my_hash)
    return my_hash1.merge(my_hash2).merge(my_hash3)
  end

end
