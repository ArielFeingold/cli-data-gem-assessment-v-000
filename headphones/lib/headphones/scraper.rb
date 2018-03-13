class Headphones::Scraper

  attr_accessor :name, :price, :availability, :url

    def self.scrape_in_ear
      doc = Nokogiri::HTML(open("https://www.cnet.com/topics/headphones/best-headphones/earbuds/"))
      in_ear_array =[]
      
binding.pry
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
