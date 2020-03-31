class CLI
    
    def start
        API.episodes
        self.welcome
        self.valid
        
        # self.get_episode_list
        # self.call
    end

    def welcome
       input = ''
        puts "\nWelcome to..." 
        sleep 1.5
        puts "Interdimensional CLI"
        sleep 1.5
        puts "\nPLEASE SELECT A CHOICE"
        puts "To see episodes in chronological, 'list'"
        puts "To see a list of characters, 'char list'"
        puts "To select characters by episode 'by episode'"
        puts "To select see more information on characters you love 'info'"
        puts "to see all the episodes a character was featured in 'by character'"
        puts "or to exit, 'exit'"
        puts "To see list again enter 'menu'"
        input = gets.strip.downcase
            
            if input == 'eps list'
                list_episodes
            elsif input == 'char list'
                list_characters
    
            elsif input == 'by episode'
                list_charaters_by_episode
    
            elsif input == 'info'
                character_info
    
            elsif input == 'menu'
                    welcome
            end
    end

    def valid
        input = ''
        if input == 'eps list'
            list_episodes
        elsif input == 'char list'
            list_characters

        elsif input == 'by episode'
            list_charaters_by_episode

        elsif input == 'info'
            character_info

        elsif input == 'menu'
                welcome
        end
        input = gets.strip.downcase
    end


    def list_episodes
        puts "\nall episodes in chonological order"
        sleep 1.5
        Episode.list_episodes 
        self.back   
    end
    

    def list_characters
        input = ''
        char = Character.char_urls[0, 10]
        API.characters(char)
        Character.all(&:name).each.with_index(1) {|char, idx| puts "#{idx} #{char.name}"}
        puts "For more characters 'm'"
        i = 10
        input = gets.chomp
        while input == 'm'
            input = ''
            char = Character.char_urls[i, 10]
            API.characters(char)
            Character.all(&:name).each.with_index(1){|char, idx| puts "#{idx} #{char.name}"}
            i+= 10 
            input = gets.chomp.downcase
            puts "For more characters 'm'"
        end
    end

    def list_charaters_by_episode
        input = ''
        list_episodes
        puts "please enter the episode name:"
        input = gets.chomp
        urls = Episode.chars_from_episode(input)
        puts "Loading..."
        if API.characters(urls)
         Character.all(&:name).each.with_index(1) do |char, idx|
        puts "#{idx} #{char.name}"
         end
        end
        self.back
    end

    def character_info
       input = ''
       list_characters
       puts "Type the name of the character you'd like to know more about:"
       input = gets.chomp
       char = Character.find_by_name(input)
       puts "#{char.name} is #{char.gender} #{char.species} and he is #{char.status} on #{char.location["name"]} and originated from #{char.origin["name"]}."
       self.back
    end

    def back
        input = ''
        puts "'to see menu 'menu'"
        input = gets.chomp
        if input == 'menu'
            welcome
        end
    end
end