# Flutter News Application

News App developed with Flutter.

 <img src="https://github.com/ChouguleAnkita13/Flutter_News_App/assets/155567405/5a150f48-51b2-406d-b197-34e0cc8c289a" alt="Image Description" width=250 height=300>



## Project Structure

The project follows the MVC (Model-View-Controller) architecture for better organization and scalability.

```bash
lib/
├── controller/
│   ├── news_provider.dart         # Business logic and state management
│   └── getnews.dart               # API call to fetch news data
├── model/
│   └── news_model.dart            # Data models
├── view/
│   ├── screens/
│   │   ├── bookmarked_news_screen.dart # UI for bookmarked news
│   │   ├── home.dart                   # UI for home screen
│   │   ├── login_screen.dart           # UI for login screen
│   │   ├── signup.dart                 # UI for signup screen
│   │   ├── details_screen.dart         # UI for news details
│   │   └── splash_screen.dart          # UI for splash screen
│   └── widgets/
│       ├── menubar.dart                # Custom menu bar widget
│       └── news.dart                   # Custom widget to display news articles
├── route/
│   └── app_route.dart                  # Application routes
└── main.dart                           # Application entry point
```

## Libraries used

#### google_fonts:
 This dependency allows easy integration of custom fonts from the Google Fonts library into the Flutter application, enhancing typography and visual design.

#### http:
 The HTTP package facilitates making HTTP requests within the Flutter application, enabling communication with remote servers to fetch data, such as news articles, from APIs.

#### url_launcher:
 This package provides functionality to launch URLs, enabling the Flutter application to open external web links or perform actions associated with URLs, such as sending emails or making phone calls.

#### provider: 
Provider is a state management library for Flutter applications, used to manage application state and data flow efficiently. It enables the sharing of data between different parts of the application and helps maintain a clean and scalable codebase.

## License

[MIT](https://choosealicense.com/licenses/mit/)

