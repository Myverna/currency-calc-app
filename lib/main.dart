// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'utils/app_state.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Calc Pro',
      theme: ThemeData(
        // CYBERPUNK THEME - No cardTheme used
        brightness: Brightness.dark,
        primaryColor: const Color(0xFFA855F7), // Neon purple
        scaffoldBackgroundColor: const Color(0xFF0A0A0F), // Almost black
        
        // App Bar - Glowing cyberpunk style
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 8,
          backgroundColor: Color(0xFF121226),
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.5,
            color: Color(0xFF06D6A0), // Cyan title
            shadows: [
              Shadow(
                blurRadius: 10,
                color: Color(0xFF06D6A0),
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        
        // Buttons - Glowing neon buttons
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1A1A2E),
            foregroundColor: const Color(0xFF06D6A0), // Cyan text
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(
                color: Color(0xFFA855F7), // Purple border
                width: 2,
              ),
            ),
            elevation: 5,
            shadowColor: const Color(0xFFA855F7).withOpacity(0.5),
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
            ),
          ),
        ),
        
        // Input Fields - Cyberpunk style with glowing borders
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF1A1A2E),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Color(0xFFA855F7),
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Color(0xFFA855F7),
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Color(0xFF06D6A0), // Cyan when focused
              width: 3,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 18,
          ),
          labelStyle: const TextStyle(
            color: Color(0xFFA855F7),
            fontWeight: FontWeight.w600,
            fontSize: 16,
            letterSpacing: 1,
          ),
          hintStyle: const TextStyle(
            color: Color(0xFF94A3B8),
            fontSize: 14,
          ),
        ),
        
        // Text Theme - Futuristic glowing text
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w900,
            color: Colors.white,
            letterSpacing: 2,
            shadows: [
              Shadow(
                blurRadius: 10,
                color: Color(0xFFA855F7),
              ),
            ],
          ),
          displayMedium: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: Color(0xFF06D6A0), // Cyan for important numbers
            letterSpacing: 1.5,
          ),
          displaySmall: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            letterSpacing: 1,
          ),
          titleLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: Color(0xFFA855F7), // Purple titles
            letterSpacing: 1,
          ),
          titleMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          titleSmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF94A3B8),
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            color: Color(0xFFE2E8F0),
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            color: Color(0xFFCBD5E1),
          ),
          labelLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFFFF006E), // Hot pink for action labels
            letterSpacing: 1,
          ),
        ),
        
        // Bottom Navigation - Futuristic
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: const Color(0xFF121226).withOpacity(0.95),
          selectedItemColor: const Color(0xFF06D6A0),
          unselectedItemColor: const Color(0xFFA855F7).withOpacity(0.7),
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          elevation: 12,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 11,
          ),
        ),
        
        // Floating Action Button - Cyberpunk style
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF06D6A0),
          foregroundColor: Color(0xFF0A0A0F),
          iconSize: 56,
          elevation: 10,
          shape: CircleBorder(),
        ),
        
        // Icon Theme - Neon icons
        iconTheme: const IconThemeData(
          color: Color(0xFFA855F7),
          size: 24,
        ),
        
        // Divider - Glowing line
        dividerTheme: DividerThemeData(
          color: const Color(0xFFA855F7).withOpacity(0.4),
          thickness: 1,
          space: 20,
          indent: 20,
          endIndent: 20,
        ),
        
  
        // Chip Theme - Neon selection chips
        chipTheme: const ChipThemeData(
          backgroundColor: Color(0xFF1A1A2E),
          selectedColor: Color(0xFF06D6A0),
          disabledColor: Color(0xFF2D3748),
          labelStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        ),
        
        // Progress Indicator - Neon
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Color(0xFF06D6A0),
          circularTrackColor: Color(0xFF1A1A2E),
        ),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}