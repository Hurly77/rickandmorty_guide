class CLI
    
    def start
        API.episodes
        self.welcome        
    end

    def welcome
       input = ''
        puts "\nWelcome to..." 
        sleep 1
        puts "Interdimensional CLI"
        sleep 1
        puts "\nPLEASE SELECT A CHOICE"
        puts "Type '1' To see episodes in chronological."
        puts "Type '2' To see a list of characters."
        puts "Type '3' To select characters by episode."
        puts "Type '4' To see more information on characters you love."
        puts "To see list again enter 'menu'"
        puts "or to exit, 'exit'\n"
        input = gets.strip.downcase
            if input == '1'
                list_episodes
                self.back

            elsif input == '2'
                list_characters
                self.back
    
            elsif input == '3'
                list_charaters_by_episode
                self.back
    
            elsif input == '4'
                character_info
                self.back

            elsif input == 'menu'
                welcome

            elsif input == 'exit'
                exit!

            else
                puts "Invalid try again!"
                sleep 2 
                welcome
             end
    end

    def list_episodes
        puts "\nall episodes in chonological order"
        sleep 1
        Episode.list_episodes 
    end
    

    def list_characters
        Character.first_ten
        input = ''
        input = gets.chomp.downcase
        i = 10
        while input == 'm'
            input = ''
            char = Character.char_urls[i, 10]
            API.characters(char)
            Character.all.last(10).each do |char| 
                puts "#{char.id}. #{char.name}"
                sleep 0.1
            end
                i+= 10 
            input = gets.chomp
        end
    end

    def list_charaters_by_episode
        puts "\n"
        list_episodes
        puts "please enter the episode number:"
        input = ''
        input = gets.chomp.to_i
        urls = Episode.chars_from_episode(input)
        API.characters(urls)
        Character.all.last(10).each do |char| 
            puts "#{char.id}. #{char.name}" 
            sleep 0.1
        end
    end

    def character_info
       puts "\n"
       input = ''
       list_characters
       puts "Type the number of the character you would like to know more about:"
       input = gets.chomp.to_i
       char = Character.find_by_name(input)
       sleep 1
       puts "\n#{char.name} is a #{char.gender} #{char.species} and he is #{char.status} on #{char.location["name"]} and originated from #{char.origin["name"]}."
    end

    def back
        puts "To go back type 'menu'"
        input = ''
        input = gets.chomp
        i = 0
        while i < 5  
            if input == 'exit'
                exit!
            elsif input == 'menu'
                welcome
            elsif input != 'menu'
                puts "Sorry invalid try again"
            end
            i += 1
            input = gets.chomp
        end
            puts "Sorry bye...."
            sleep 3
    end
end