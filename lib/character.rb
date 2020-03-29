class Character
    attr_accessor :id, :name, :status, :species, :type, :gender, :origin, :location, :image, :episode, :url, :created
    @@all = []

    def initialize(hash)
        hash.each {|key, value|
        self.send(("#{key}="), value)}
        @@all << self
        # Episode.all.each {|obj| obj.characters = self}
        # binding.pry
    end

    def self.all
        @@all
    end

    def self.list_characters
        self.all(&:name).each {|char| puts "#{char.id}. #{char.name}"}  
    end

end