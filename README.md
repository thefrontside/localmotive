# Localmotive: a Rails Engine for local development

Very often, we want to override the settings for our application which are contained in source control with our own
local values. This could be to use our own AWS key, SMTP server, or database url. It is also useful to run a tweaked
version of your production or staging environment that is mostly faithful to the original but has some extras to make it
friendlier for local development (like not using a CDN)

For these reasons and more, localmotive lets you maintain your own custom per-environment configurations that lie
outside your main source control without giving up orderliness.


## Installation

Add this to your rails application's development group:

    group :development do
      gem 'localmotive'
    end

If you want to use localmotive in environments other than just development, you can either enumerate them

    gem 'localmotive', :groups => [:development, :test]

Or just add it to the default group

    gem 'localmotive'

## Usage

To get started, run the install command

    rails generate localmotive

This will generate your local config files

    create  .local/config/application.rb
    create  .local/config/environments/development.rb
    create  .local/config/environments/production.rb
    create  .local/config/environments/test.rb
    append  .gitignore


This will create a mirror of your rails environment configuration files in the `.local` directory and add it to your
.gitignore. That way, each developer can locally configure their application to their heart's content without worrying
about

1. clobbering anybody else's configuration
1. accidentally checking in sensitive configuration information to source control

The load rules of your local environment shadow those of vanilla rails. So, if you are running in the development
environment, localmotive will load

1. `.local/config/application.rb`
1. `.local/config/environments/development.rb`

local configuration files are loaded only after all stock configuration has been run, but before application
initialization. That way, you can be sure that your settings will take precedence.

## Credits

Localmotive was developed at [The FrontSide][1] in order to avoid development papercuts

[1]: http://thefrontside.net


