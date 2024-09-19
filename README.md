# Shiftcare Client Manager (Exam)
Shiftcare Client Manager is a Ruby on Rails application designed to streamline the management of client information and care scheduling for healthcare professionals and agencies. It provides an easy-to-use interface for managing client profiles, tracking shifts, assigning caregivers, and ensuring that care is delivered efficiently. The platform helps healthcare providers maintain accurate records, streamline communication, and automate key processes involved in client care.

# Prerequisites
[![Ruby Style Guide](https://img.shields.io/badge/Ruby-3.3.5-red)](https://www.ruby-lang.org/en/news/2024/09/03/3-3-5-released/)
[![Ruby Style Guide](https://img.shields.io/badge/Rails-7.2.1-brightgreen)](https://rubygems.org/gems/rails)

# Features
#### Offline Capability: `Thanks to PWA technology, works offline or on low-quality networks.`
#### Responsive Design: `The app adapts to various screen sizes, from mobile phones to desktops.`
#### Installable: `Users can install on their home screens for quick access.`
#### CLI: `Can run in console` 
```rake management_system:cli```

# Setup

### Install Ruby

Ensure you have Ruby installed on your system. You can download Ruby from the [official Ruby website](https://www.ruby-lang.org/en/downloads/) or use a version manager like [rbenv](https://github.com/rbenv/rbenv) or [rvm](https://rvm.io/).

### First-time setup

1. install Ruby
2. download and install postgresql. https://www.postgresql.org/download
3. install RubyMine. https://www.jetbrains.com/ruby/download/#section=windows
4. **Run** the following command.

```bash
gem install rails
```

### Database and Master key

Ask for the master.key files. This is needed for the local setup.

# Running app on localhost

1. Clone the repo or pull main branch.
2. **Run** the following command.

```bash
cd ShiftCare-Challenge-CLI-Application
```

```bash
bundle install
```
### Database Setup

Create, migrate and seed the database.

```bash
rake db:create
rake db:migrate
rake db:seed
```

### Run the Application

3. Start the server by running `rails s` or press the play button or `SHIFT + F10` in RubyMine.

You may edit the configuration and set the port to `3000` so that the server will run on **localhost:3000**.




## If you want to use the CLI - Interact with the CLI

You will be presented with a menu with the following options:

1. **Search by a field**: Allows you to search based on a specific field.
2. **Find data with duplicate values**: Allows you to find data with duplicate values in a specific field.
3. **Exit**: Exits the application.

Follow the prompts to make your selection and enter any required information.
```bash
rake management_system:cli
```

### Running Tests
To run your RSpec tests, navigate to the root directory of your project and run:
```bash
rspec
```

## Code Signature

This code and documentation was developed by Cris Joseph Nahine.

## License

This application is provided as-is without any warranty. Feel free to modify and use it as needed.
