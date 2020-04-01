class API
  
    def self.episodes
        i = 1
        while i < 3
            response = HTTParty.get("http://rickandmortyapi.com/api/episode?page=#{i}")
            response["results"].each {|hash| Episode.new(hash)}
                i += 1
        end
    end

    def self.characters(val)
        array = val.map {|str|  HTTParty.get("#{str.gsub("https", "http")}")}
        array.each {|hash| Character.new(hash)}
    end
    
    def self.locations
        i = 1
        while i < 5
            response = HTTParty.get("http://rickandmortyapi.com/api/character?page=#{i}")
            episodes = response["results"].each {|hash| Location.new(hash)}
                i += 1
        end
    end

end