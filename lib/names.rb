class Names
    attr_accessor :name, :url, :bio
    @@all = []

    def initialize(name, url)
        @name = name
        @url = url
    end

    def save
        @@all << self
    end
    
    def self.all
        @@all
    end


end