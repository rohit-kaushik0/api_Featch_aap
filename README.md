# API Fetch App

## Overview

API Fetch App is a Flutter application that demonstrates how to:
- Fetch data from a public API using a manual action.
- Display the fetched data in a beautifully styled, scrollable ListView.
- Implement pull-to-refresh for interactive updates.
- Gracefully handle API errors with user-friendly messages.
- Reset the view to the initial state using a "Back" button.

## Features

- Manual data fetching via a "Fetch Data" button.
- Ability to return to a blank state using a "Back" button in the AppBar.
- Pull-to-refresh functionality for realtime updates.
- Enhanced UI with custom theming, improved card designs, and consistent button styles.
- Robust error handling for a better user experience.

## Getting Started

1. Ensure Flutter is installed. Follow the [Flutter installation guide](https://docs.flutter.dev/get-started/install) if needed.
2. Clone the repository:
   ```
   git clone <repository_url>
   ```
3. Navigate to the project directory:
   ```
   cd api_fetch_app
   ```
4. Install the dependencies:
   ```
   flutter pub get
   ```
5. Run the application:
   ```
   flutter run
   ```

## Project Structure

- `lib/main.dart`: Main application code with interactive UI controls and state management.
- `lib/api_service.dart`: API service responsible for fetching post data.
- `README.md`: Project overview and setup instructions.

## Additional Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [HTTP Package on Pub.dev](https://pub.dev/packages/http)
