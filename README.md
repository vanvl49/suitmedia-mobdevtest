# Suitmedia Mobile Dev Internship Test

A simple Flutter app built for Suitmedia's Mobile Developer Internship test. Features include a palindrome checker, and a user list screen that fetches paginated data from reqres.in API with pull-to-refresh, infinite scroll, empty state handling, and user selection that updates the previous screen.

## Features

- **Palindrome Checker**  
  Simple form to input a string and check if it's a palindrome.  
  Displays a custom dialog with the input, status (Palindrome/Not), and corresponding icons.

- **User List Screen**
  - Fetches user data from [reqres.in](https://reqres.in/api/users)
  - Supports pagination with `page` & `per_page` params
  - Pull-to-refresh functionality
  - Infinite scrolling (loads next page on bottom scroll)
  - Empty state message if no users found
  - User selection updates label in the previous screen

## Tech Stack

- **Flutter** version 3.32.7
- **Provider** for state management
- **HTTP** package for API calls

## Demo Video

[![Watch the demo](https://img.youtube.com/vi/q3qzMUxsgBM/hqdefault.jpg)](https://www.youtube.com/shorts/q3qzMUxsgBM)


## Installation

1. Clone this repo  
   ```bash
   git clone https://github.com/your-username/suitmedia-mobile-test.git

2. Get dependencies
   ```bash
   flutter pub get

3. Run the app
   ```bash
   flutter run
