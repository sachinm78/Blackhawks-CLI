class Players
    attr_accessor :initial, :name, :url, :position, :height, :weight, :age, :bio
    @@all = []

    def initialize(name, url)
        # initialize(initial, name, url)
        # @initial = initial
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