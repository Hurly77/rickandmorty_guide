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
        puts "type menu to go back"
    end

    def self.find_by_name(id)
       char_name = self.all.find {|obj| obj.id == id}
    end
    
    def self.chars_from_episode(id)
       result = self.find_by_name(id)
       result.characters
    end
end