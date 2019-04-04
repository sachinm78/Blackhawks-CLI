
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "Blackhawks/version"

Gem::Specification.new do |spec|
  spec.name          = "Blackhawks"
  spec.version       = Blackhawks VERSION
  spec.authors       = ["Sachinm78"]
  spec.email         = ["sachinm78@gmail.com"]

  spec.summary       = %q{This Ruby Gem provides a CLI view of the 2019 Chicago Blackhawks roster by scraping player names, attributes and bios and providing them to the user.}

  spec.description   = %q{To run the application, enter the Blackhawks folder.

Type "cd Blackhawks" into your console.

Then, run the program by typing:

  "ruby bin/hawks"

This should welcome you to the application and provide a numbered list of players to choose from.

To see more information about a player, enter their number from the lost provided.  

This should print the player\s information to your concole.  You can choose to select another player by pressing "y" when prompted.  This should return you to the list of players where you can enter in another number.  

If you would like to exit the application, enter "n" when prompted.  The program will automatically exit.
  spec.homepage      = "https://github.com/sachinm78/Blackhawks-CLI.git"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/sachinm78/Blackhawks-CLI.git"
    spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
end
