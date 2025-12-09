// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'converter_screen.dart';
import 'calculator_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const ConverterScreen(),
    const CalculatorScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.currency_exchange, size: 32),
            SizedBox(width: 12),
            Text(
              'CURRENCY CALC PRO',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
                fontSize: 20,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFF121226),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0A0A0F),
              Color(0xFF121226),
            ],
            stops: [0.0, 0.8],
          ),
        ),
        child: _screens[_selectedIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFA855F7).withOpacity(0.5),
              blurRadius: 20,
              spreadRadius: 2,
              offset: const Offset(0, -3),
            ),
          ],
          border: Border.all(
            color: const Color(0xFFA855F7).withOpacity(0.3),
            width: 1,
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: BottomNavigationBar(
            backgroundColor: const Color(0xFF121226),
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: _selectedIndex == 0
                        ? const LinearGradient(
                            colors: [
                              Color(0xFFA855F7),
                              Color(0xFF06D6A0),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          )
                        : null,
                    color: _selectedIndex == 0 
                        ? null 
                        : Colors.transparent,
                    border: Border.all(
                      color: _selectedIndex == 0
                          ? Colors.transparent
                          : const Color(0xFFA855F7).withOpacity(0.5),
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    Icons.currency_exchange,
                    color: _selectedIndex == 0 
                        ? Colors.white
                        : const Color(0xFFA855F7),
                    size: 28,
                  ),
                ),
                label: 'CONVERTER',
                activeIcon: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFA855F7),
                        Color(0xFF06D6A0),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF06D6A0).withOpacity(0.5),
                        blurRadius: 10,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.currency_exchange,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: _selectedIndex == 1
                        ? const LinearGradient(
                            colors: [
                              Color(0xFF06D6A0),
                              Color(0xFFA855F7),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          )
                        : null,
                    color: _selectedIndex == 1 
                        ? null 
                        : Colors.transparent,
                    border: Border.all(
                      color: _selectedIndex == 1
                          ? Colors.transparent
                          : const Color(0xFF06D6A0).withOpacity(0.5),
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    Icons.calculate,
                    color: _selectedIndex == 1 
                        ? Colors.white
                        : const Color(0xFF06D6A0),
                    size: 28,
                  ),
                ),
                label: 'CALCULATOR',
                activeIcon: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF06D6A0),
                        Color(0xFFA855F7),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFA855F7).withOpacity(0.5),
                        blurRadius: 10,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.calculate,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
            ],
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 12,
              letterSpacing: 1,
              color: Color(0xFF06D6A0),
            ),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 11,
              letterSpacing: 1,
              color: Color(0xFFA855F7),
            ),
            selectedItemColor: const Color(0xFF06D6A0),
            unselectedItemColor: const Color(0xFFA855F7),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            elevation: 20,
          ),
        ),
      ),
    );
  }
}