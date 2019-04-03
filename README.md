Blackhawks CLI 

This Ruby Gem provides a CLI view of the 2019 Chicago Blackhawks roster by scraping player names, attributes and bios and providing them to the user.  

## Installation

    $ gem install Blackhawks

## Usage

To run the application, enter the Blackhawks folder.

    Type "cd Blackhawks" into your console.

Then, run the program by typing:

    "ruby bin/hawks"

This should welcome you to the application and provide a numbered list of players to choose from.

To see more information about a player, enter their number from the lost provided.  

This should print the player's information to your concole.  You can choose to select another player by pressing "y" when prompted.  This should return you to the list of players where you can enter in another number.  

If you would like to exit the application, enter "n" when prompted.  The program will automatically exit.  

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/Blackhawks. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Blackhawks project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/Blackhawks/blob/master/CODE_OF_CONDUCT.md).
