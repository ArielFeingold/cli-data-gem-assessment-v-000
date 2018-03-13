require 'pry'
class Headphones::CLI

  attr_accessor :in_ear, :over_ear, :on_ear

    def call
      list_types
    end

    def list_types

        puts "Welcome to headphone guide"
        puts "please choose headphone type. To quit type exit"
        puts "1. In-ear"
        puts "2. Over-ear"
        puts "3. On-ear"

        input = nil

        while input != "exit" || !input.to_i.between?(1,3)
          input = gets.strip
          case input
          when "1"
              list(@in_ear)
            when "2"
              list(@over_ear)
            when "3"
              list(@in_ear)
            when "exit"
              puts "goodby"
              exit
            else
              puts "Please choose valid number"
              puts "1. In-ear"
              puts "2. Over-ear"
              puts "3. On-ear"
          end
        end

    end

    def list(array)
      array = [{"name" => "sony", "description" => "sony description"},
                      {"name" => "boss", "description" => "boss description"},
                      {"name" => "beats", "description" => "beats description"}]
      puts "Here are the top In-ear headphones. Type number for more info, to start over type exit"
      array.each.with_index {|h, i| puts "#{i + 1}. #{array[i]["name"]}- #{array[i]["description"]}."}

      input = nil

      while input != "exit" || !input.to_i.between?(1,array.length)
      input = gets.strip
        if input.to_i.between?(1, array.length)
          puts " #{array[input.to_i - 1]}"
          again
        elsif input.downcase == "exit"
          puts "goodby!"
          exit
        else
          puts "Please choose valid number"
          array.each.with_index {|h, i| puts "#{i + 1}. #{array[i]["name"]}- #{array[i]["description"]}."}
        end
      end
    end

    def again
      puts "Do you want to search again? y/n"

      input = nil
      while input != "n"
      input = gets.strip
        if input == "y"
          list_types
        else
          puts "Do you want to search again? y/n"
      end
    end
    puts "Goodby!"
    exit
  end

end
