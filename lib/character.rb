class Character
    attr_accessor :id, :name, :status, :species, :type, :gender, :origin, :location, :image, :episode, :url, :created
    @@all = []

    def initialize(hash)
        hash.each {|key, value|
        self.send(("#{key}="), value)}
        @@all << self
    end

    def self.all
        @@all
    end

    def self.char_urls
        char = Episode.all.map {|obj| obj.characters}
        char = char.flatten.uniq
        char = char.sort_by do |str| str[42, 3].to_i end
    end

    def self.find_by_name(name)
        self.all.find {|char| char.name == name}
     end
    
end