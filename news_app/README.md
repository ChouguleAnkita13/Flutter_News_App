# Flutter News Application

News App developed with Flutter.

## Project Structure
The project follows the MVC (Model-View-Controller) architecture for better organization and scalability.

lib/
├── controller/
│   ├── news_provider.dart         # Business logic and state management
│   └── getnews.dart               # API call to fetch news data
├── model/
│   └── news_model.dart            # Data models
├── view/
│   ├── screens/
│   │   ├── bookmarked_screen.dart # UI for bookmarked news
│   │   ├── home_screen.dart       # UI for home screen
│   │   ├── login_screen.dart      # UI for login screen
│   │   ├── signup_screen.dart     # UI for signup screen
│   │   ├── details_screen.dart    # UI for news details
│   │   └── splash_screen.dart     # UI for splash screen
│   └── widgets/
│       ├── menubar.dart           # Custom menu bar widget
│       └── news.dart              # Custom widget to display news articles
├── route/
│   └── app_route.dart             # Application routes
└── main.dart                      # Application entry point
