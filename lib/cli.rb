class CLI
    
    def start
        puts "LOADING..."
        API.episodes
        self.welcome
        # self.get_episode_list
        # self.call
    end

    def welcome
        input = ''
        while input != "exit"
        puts "welcome to Interdimensional CLI"
        puts "please select a choice"
        puts "To see episodes in chronological, 'list'"
        puts "To see a list characters, 'char list'"
        puts "To select characters by episode 'episode'"
        puts "to select episode by character 'character'"
        puts "or to exit, 'exit'"
        puts "to revits list enter any key"

        if input == 'eps list'
        list_episodes
        end

        if input == 'episode'
            list_charaters_by_episode
        end

        input = gets.strip
        end
    end

    def list_episodes
        puts "\nall episodes in chonological order"
        sleep 1.5
        Episode.list_episodes    
    end

    def list_characters
        puts "here are all the characters"
        sleep 1.5
        Character.list_characters
        
    end

    def list_charaters_by_episode
        input = ''
        list_episodes
        puts "please enter the episode name:"
        input = gets.chomp
        urls = Episode.chars_from_episode(input)
        if API.characters(urls)
         Character.all(&:name).each.with_index(1) do |char, idx|
            puts "#{idx} #{char.name}"
         end
        end
    end

        # def get_episode_list
    # Episode.all_episodes_by_name
    #     binding.pry
    # end
    
end