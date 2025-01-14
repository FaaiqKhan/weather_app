# Weather App

## Overview

The Weather App is a user-friendly mobile application designed to provide users with accurate and
up-to-date weather information of a week. 
This app is built with a focus on performance, responsiveness, and an intuitive user interface.

## Features
1. ### Loading Indicator
    * A loading indicator is displayed whenever the app fetches weather data, ensuring users know the ongoing process.

2. ### Weather List Item
    * Each weather list item contains:
      * The day of the week abbreviation (e.g., Mon, Tue).
      * A weather condition image (e.g., sunny, cloudy).
      * Highest and lowest temperature of the day (e.g, 34/21°F, 4/-2°C).

3. ### Weather Details View
   * The details section displays comprehensive weather information, including:
     * The full day of the week (e.g., Monday).
     * Weather condition name (e.g., "Partly Cloudy").
     * Weather condition image.
     * Current temperature.
     * Humidity percentage.
     * Atmospheric pressure (in hPa).
     * Wind speed (in km/h).

4. ### Interactive Weather List
   * Selecting a weather list item updates the weather details section with information specific to the selected day.

5. ### Pull-to-Refresh Gesture
   * Users can refresh the weather information by performing a pull-to-refresh gesture, ensuring they always have the most recent data.

6. ### Error Handling
   * If data fetching fails, an error screen is displayed with:
     * A retry button to attempt fetching the data again.

7. ### Responsive Design
   * The app supports horizontal and vertical layouts, ensuring a seamless experience on devices of all screen sizes and orientations.

8. ### Temperature Unit Conversion
   * Users can select between Celsius (C) and Fahrenheit (F) for temperature display.

## Technologies Used
* **StateManagement**: Bloc
* **Network Calls**: Dio
* **Mocking Data**: Mockito
* **Responsive Design**: Media Queries
* **Unit Tests**: Test
* **Bloc Testing**: Bloc Test

## Code Quality
Used Clean Architecture and S.O.L.I.D principles to maintain code quality and distributed 
the layers in packages.