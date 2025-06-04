# MovieTask
a simple iOS application that displays a list of movies fetched from TMDB movie API 

## Features


### Movie Listing:

- Design Build with SwiftUI.
- Fetches Movies from the TMDB API.
- Displays Movies in a paginated way.



### Movie Details:

- build with UIkit
- Navigates to a detailed view (MovieDetailsVC) when a Movie is selected with required detils for this Movie.


### Error Handling:

- Handles API errors (e.g., no internet, invalid URL, decoding issues).

### Caching:

- caching using On first launch, fetch data from API and cache it.

### Testing:

- Unit tests for DomainLayer (MovieUseCase) ViewLayer (ViewModel)

## Screenshots     

<img src="https://github.com/user-attachments/assets/7c4862e7-1bd3-4399-b850-b42358f131b6" alt="Home Screen" width="180"/>
<img src="https://github.com/user-attachments/assets/acae9ffe-9955-4678-823c-8cd0c53b6beb" alt="Home Screen" width="180"/>



## Architecture

The app follows Clean Architecture with MVVM to separate concerns and enhance testability:

### Domain Layer:

Contains business entities (UpComingModel) and use cases (getMovieUseCase).
Independent of frameworks and UI.

### Data Layer:

- Handles data fetching (NetworkService, MovieDataSource, MovieRepository).
- Defines errors (APIError).

### Presentation Layer:

- Manages UI state (ViewModel).
- Displays UI (HomeView, UpComingCell, ProductDetailsViewController).
- Uses swift UI & programmatically.


## Requirements

- Xcode: 16.2
- Swift: 5.0
- Dependencies: KingFisher (via Swift Package Manager)
- Support iOS 15+

## Setup Instructions

### Prerequisites

 - Install Xcode from the Mac App Store.
 - Ensure you have Git installed.

### Installation

- git clone https://github.com/Shekoovic100/MovieTask
- Open the Project:
- Open MovieTask.xcodeproj in Xcode.
- Build and Run:
Select a simulator (e.g., iPhone 14) or a physical device.
Press Cmd + R to build and run the app.


## Configuration

API: The app uses https://api.themoviedb.org/3/movie/upcoming with API key is required.
to get API key you should go to https://api.themoviedb.org and register to get the key 
Network: Ensure an internet connection for initial data fetching. 

## Testing

The app includes unit tests using XCTest.
