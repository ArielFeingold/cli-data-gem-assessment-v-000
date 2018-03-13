class Headphones::Scraper

  attr_accessor :name, :price, :availability, :url

    def self.scrape_in_ear
      doc = Nokogiri::HTML(open("https://www.cnet.com/topics/headphones/best-headphones/earbuds/")).css("#rbContent div.bestListing ul li div.itemWrap")

      in_ear_array =[]

      doc.each do |headphone|
        h_name = headphone.css("h5").text
        h_price = headphone.css(".price")
        h_url = "https://www.cnet.com#{doc.css(".review").attribute("href").value}"
        h_rating = headphone[1].css(".subrating").attribute("aria-lable").value

        in_ear_array << {name: h_name, price: h_price, url: h_url, rating: h_rating}
      end


      doc.css("div.bestListings").each do |card|
      card.css(".student-card a").each do |student|
        student_profile_link = "#{student.attr('href')}"
        student_location = student.css('.student-location').text
        student_name = student.css('.student-name').text
        students << {name: student_name, location: student_location, profile_url: student_profile_link}
      end
    end

    end

    def self.scrape_on_ear
      doc = Nokogiri::HTML(open("https://www.cnet.com/topics/headphones/best-headphones/on-ear/"))
    end

    def self.scrape_over_ear
      doc = Nokogiri::HTML(open("https://www.cnet.com/topics/headphones/best-headphones/over-the-ear/"))
    end


end
