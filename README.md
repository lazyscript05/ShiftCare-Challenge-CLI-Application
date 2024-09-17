# ShiftCare Challenge CLI Application

## Overview
[![Ruby Style Guide](https://img.shields.io/badge/Ruby-3.3.5-red)](https://www.ruby-lang.org/en/news/2024/09/03/3-3-5-released/)

This Ruby command-line application allows you to manage and search data dynamically. You can perform operations such as searching by a specific field or finding duplicate values. The application is designed to be flexible; it will automatically accept and use any valid JSON data as long as it follows the correct format, even if the data inside data.json changes.
## Files

- **`cli.rb`**: The main Ruby script for the command-line interface.
- **`data.json`**: The JSON file containing data.

## Setup

### Install Ruby

Ensure you have Ruby installed on your system. You can download Ruby from the [official Ruby website](https://www.ruby-lang.org/en/downloads/) or use a version manager like [rbenv](https://github.com/rbenv/rbenv) or [rvm](https://rvm.io/).

### Download the Application

Clone or download the repository containing `cli.rb` and `data.json` files to your local machine.

```
git clone <repository-url>
cd <repository-directory>
```

### Prepare the Data

Make sure that `data.json` is located in the same directory as `cli.rb`. The JSON file should contain valid JSON data. Each data entry should be a valid JSON object, but the structure of the JSON data can vary as long as it is properly formatted.

## Usage

### Run the Application

Make sure to install `terminal-table` and `rspec`
```bash
gem install terminal-table
gem install rspec
```

Open your terminal, navigate to the directory containing `cli.rb`, and run the application with:

```bash
ruby cli.rb
```

### Interact with the CLI

You will be presented with a menu with the following options:

1. **Search by a field**: Allows you to search based on a specific field.
2. **Find data with duplicate values**: Allows you to find data with duplicate values in a specific field.
3. **Exit**: Exits the application.

Follow the prompts to make your selection and enter any required information.
```bash
ruby cli.rb
```

### Running Tests
To run your RSpec tests, navigate to the root directory of your project and run:
```bash
rspec
```

## Assumptions

- **File Paths**: The `data.json` file is expected to be in the same directory as the `cli.rb` script.
- **JSON Structure**: The JSON file must be properly formatted. Each entry should be a valid JSON object, though the specific fields can vary. The application will display available fields dynamically based on the data present in the JSON file.
- **Field Names**: Fields in the JSON file are assumed to be strings and are matched case-insensitively during searches.
- **Error Handling**: Basic error handling is included for invalid choices and missing fields.

## Troubleshooting

### Missing `terminal-table` Gem

If you encounter the following error:

```
require': cannot load such file -- terminal-table (LoadError)
```

You need to install the `terminal-table` gem. Run the following command to install it:

```bash
gem install terminal-table
```

### JSON File Issues

If you encounter issues with loading the JSON file, ensure that the file is named correctly (`data.json`) and located in the same directory as `cli.rb`.

### Ruby Installation

Verify that Ruby is installed and correctly configured on your system.

## Code Signature

This code and documentation was developed by Cris Joseph Nahine.

## License

This application is provided as-is without any warranty. Feel free to modify and use it as needed.
