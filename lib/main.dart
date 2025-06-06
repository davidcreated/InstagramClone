// Importing Flutter's core UI toolkit
import 'package:flutter/material.dart';

// Importing a separate file that contains the HomePage widget
import 'package:instagram_clone_app/home_page.dart';

// This is the entry point of every Flutter app
void main() {
  runApp(const MyApp()); // Runs the app and starts from MyApp widget
}

// MyApp is the root widget of your application
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  }); // Constructor (optional key for widget identification)

  // This method builds (renders) the app's UI
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the debug banner at top-right
      theme: ThemeData(
        // Styling the app's top bar (AppBar)
        appBarTheme: AppBarTheme(
          elevation: 1, // Adds a small shadow below AppBar
          color: Colors.white, // AppBar background color
          iconTheme: IconThemeData(
            color: Color.fromRGBO(40, 40, 40, 1), // Icon color in AppBar
          ),
        ),
        // Color scheme for the app
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage(), // First screen of the app
    );
  }
}

// MyHomePage is a stateful widget - it can rebuild itself when data changes
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState(); // Creates the state
}

// This class holds the logic and UI for MyHomePage
class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0; // This keeps track of which bottom nav item is selected

  // The build method defines the UI of this screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(), // Main content of the screen
      backgroundColor: Colors.white, // Whole page background color
      // Bottom navigation bar (Instagram-style nav bar)
      bottomNavigationBar: ClipRRect(
        // Gives rounded top corners to the navigation bar
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: BottomAppBar(
          color: Colors.white, // Nav bar background color
          height: 60.0, // Height of the navigation bar
          notchMargin: 8.0, // Space around the floating action button (if any)
          shape: const CircularNotchedRectangle(), // Adds a notch shape
          // A row of icons (Home, Search, Video, Travel, Profile)
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround, // Even spacing
            children: [
              // HOME icon
              IconButton(
                icon: Icon(
                  Icons.home,
                  color:
                      currentPage == 0
                          ? Color.fromRGBO(203, 73, 101, 1) // Active icon color
                          : Color.fromRGBO(40, 40, 40, 1), // Inactive color
                ),
                onPressed: () {
                  setState(() {
                    currentPage = 0; // Set current page to home
                  });
                },
              ),

              // SEARCH icon
              IconButton(
                icon: Icon(
                  Icons.search,
                  color:
                      currentPage == 1
                          ? Color.fromRGBO(203, 73, 101, 1)
                          : Color.fromRGBO(40, 40, 40, 1),
                ),
                onPressed: () {
                  setState(() {
                    currentPage = 1; // Set current page to search
                  });
                },
              ),

              // VIDEO icon
              IconButton(
                icon: Icon(
                  Icons.ondemand_video,
                  color:
                      currentPage == 2
                          ? Color.fromRGBO(203, 73, 101, 1)
                          : Color.fromRGBO(40, 40, 40, 1),
                ),
                onPressed: () {
                  setState(() {
                    currentPage = 2; // Set current page to video
                  });
                },
              ),

              // TRAVEL icon
              IconButton(
                icon: Icon(
                  Icons.card_travel,
                  color:
                      currentPage == 3
                          ? Color.fromRGBO(203, 73, 101, 1)
                          : Color.fromRGBO(40, 40, 40, 1),
                ),
                onPressed: () {
                  setState(() {
                    currentPage = 3; // Set current page to travel
                  });
                },
              ),

              // PROFILE icon
              IconButton(
                icon: Icon(
                  Icons.person,
                  color:
                      currentPage == 4
                          ? Color.fromRGBO(203, 73, 101, 1)
                          : Color.fromRGBO(40, 40, 40, 1),
                ),
                onPressed: () {
                  setState(() {
                    currentPage = 4; // Set current page to profile
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
