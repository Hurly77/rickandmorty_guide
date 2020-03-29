class Episode
    attr_accessor :id, :name, :air_date, :episode, :characters, :url, :created
    @@all = []

    def initialize(hash)
        hash.each {|key, value|
        self.send(("#{key}="), value)}
        @@all << self
    end

    def self.all
        @@all
    end

    def self.list_episodes
        self.all(&:name).each {|eps| puts "#{eps.id}. #{eps.name} - #{eps.episode}"}  
    end

    def self.find_by_name(name)
        self.all.find {|eps| eps.name == name }
    end
    
    def self.chars_from_episode(name)
       result = self.find_by_name(name)
       result.characters
    end
end