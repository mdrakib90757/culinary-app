import 'package:culinary_app/feature/auth/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'feature/main_feature/view/main_feature_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal Planner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Define primary color from your design
        primaryColor: const Color(0xFFE56E4E), // Your main_feature orange color
        // Define accent color if needed, or use primary for most actions
        // Define text theme for consistency
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 96.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          displayMedium: TextStyle(
            fontSize: 60.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          displaySmall: TextStyle(
            fontSize: 48.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          headlineMedium: TextStyle(
            fontSize: 34.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          headlineSmall: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          titleLarge: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyLarge: TextStyle(fontSize: 16.0, color: Colors.black87),
          bodyMedium: TextStyle(fontSize: 14.0, color: Colors.black87),
          labelLarge: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ), // For buttons
        ),
        // appBarTheme: const AppBarTheme(
        //   backgroundColor: Color(0xFFE56E4E),
        //   foregroundColor: Colors.white,
        //   elevation: 0, // No shadow
        //   centerTitle: false,
        //   titleTextStyle: TextStyle(
        //     fontSize: 22,
        //     fontWeight: FontWeight.bold,
        //     color: Colors.white,
        //   ),
        // ),
        // // Input decoration theme for consistent text fields
        // inputDecorationTheme: InputDecorationTheme(
        //   filled: true,
        //   fillColor: Colors.white,
        //   contentPadding: const EdgeInsets.symmetric(
        //     vertical: 12,
        //     horizontal: 16,
        //   ),
        //   border: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(30.0),
        //     borderSide: BorderSide.none,
        //   ),
        //   enabledBorder: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(30.0),
        //     borderSide: BorderSide.none,
        //   ),
        //   focusedBorder: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(30.0),
        //     borderSide: BorderSide(color: Color(0xFFE56E4E), width: 1.5),
        //   ),
        //   hintStyle: TextStyle(color: Colors.grey[400]),
        // ),
        // // Other component themes like CardTheme, ButtonTheme, etc.
      ),
      home: const LoginPage(),
    );
  }
}
