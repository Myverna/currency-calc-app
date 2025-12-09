// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/app_state.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: const [
                Color(0xFF0A0A0F),
                Color(0xFF121226),
              ],
            ),
          ),
          child: Column(
            children: [
              // CYBERPUNK DISPLAY
              Container(
                padding: const EdgeInsets.all(24),
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFFA855F7).withOpacity(0.1),
                      const Color(0xFF06D6A0).withOpacity(0.05),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  border: Border(
                    bottom: BorderSide(
                      color: const Color(0xFFA855F7).withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFA855F7).withOpacity(0.2),
                      blurRadius: 20,
                      spreadRadius: 2,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Operation Preview
                    if (appState.calculatorOperation.isNotEmpty)
                      Text(
                        '${appState.calculatorFirstNumber} ${appState.calculatorOperation}',
                        style: TextStyle(
                          fontSize: 22,
                          color: const Color(0xFFA855F7),
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          shadows: [
                            Shadow(
                              blurRadius: 10,
                              color: const Color(0xFFA855F7).withOpacity(0.5),
                            ),
                          ],
                        ),
                      ),
                    // Main Display
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      child: Text(
                        appState.calculatorDisplay,
                        style: const TextStyle(
                          fontSize: 64,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF06D6A0),
                          letterSpacing: 2,
                          shadows: [
                            Shadow(
                              blurRadius: 20,
                              color: Color(0xFF06D6A0),
                            ),
                            Shadow(
                              blurRadius: 40,
                              color: Color(0xFF06D6A0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // CYBERPUNK BUTTONS GRID
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF121226),
                        Color(0xFF0A0A0F),
                      ],
                    ),
                  ),
                  child: GridView.count(
                    crossAxisCount: 4,
                    childAspectRatio: 1.2,
                    padding: const EdgeInsets.all(16),
                    children: [
                      // First Row - Top Functions
                      _cyberpunkClearButton('C', context, appState),
                      _cyberpunkClearButton('⌫', context, appState),
                      _cyberpunkOperationButton('%', context, appState),
                      _cyberpunkOperationButton('÷', context, appState),
                      
                      // Second Row
                      _cyberpunkNumberButton('7', context, appState),
                      _cyberpunkNumberButton('8', context, appState),
                      _cyberpunkNumberButton('9', context, appState),
                      _cyberpunkOperationButton('×', context, appState),
                      
                      // Third Row
                      _cyberpunkNumberButton('4', context, appState),
                      _cyberpunkNumberButton('5', context, appState),
                      _cyberpunkNumberButton('6', context, appState),
                      _cyberpunkOperationButton('-', context, appState),
                      
                      // Fourth Row
                      _cyberpunkNumberButton('1', context, appState),
                      _cyberpunkNumberButton('2', context, appState),
                      _cyberpunkNumberButton('3', context, appState),
                      _cyberpunkOperationButton('+', context, appState),
                      
                      // Fifth Row - Bottom Row
                      // Zero button (double width)
                      Container(
                        margin: const EdgeInsets.all(6),
                        child: GridTile(
                          child: _buildCyberpunkButton(
                            text: '0',
                            type: 'number',
                            context: context,
                            appState: appState,
                          ),
                        ),
                      ),
                      _cyberpunkNumberButton('.', context, appState),
                      _cyberpunkEqualsButton('=', context, appState),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Number Button (White text, purple border)
  Widget _cyberpunkNumberButton(String text, BuildContext context, AppState appState) {
    return _buildCyberpunkButton(
      text: text,
      type: 'number',
      context: context,
      appState: appState,
    );
  }

  // Operation Button (Cyan text, cyan border)
  Widget _cyberpunkOperationButton(String text, BuildContext context, AppState appState) {
    return _buildCyberpunkButton(
      text: text,
      type: 'operation',
      context: context,
      appState: appState,
    );
  }

  // Clear/Delete Button (Hot pink text)
  Widget _cyberpunkClearButton(String text, BuildContext context, AppState appState) {
    return _buildCyberpunkButton(
      text: text,
      type: 'clear',
      context: context,
      appState: appState,
    );
  }

  // Equals Button (Gradient, glowing)
  Widget _cyberpunkEqualsButton(String text, BuildContext context, AppState appState) {
    return _buildCyberpunkButton(
      text: text,
      type: 'equals',
      context: context,
      appState: appState,
    );
  }

  Widget _buildCyberpunkButton({
    required String text,
    required String type,
    required BuildContext context,
    required AppState appState,
  }) {
    // Define colors based on button type
    Color textColor;
    Color borderColor;
    Color glowColor;
    Gradient gradient;
    List<BoxShadow> shadows;

    switch (type) {
      case 'clear':
        textColor = const Color(0xFFFF006E); // Hot pink
        borderColor = const Color(0xFFFF006E);
        glowColor = const Color(0xFFFF006E);
        gradient = const LinearGradient(
          colors: [
            Color(0xFF1A1A2E),
            Color(0xFF252547),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
        shadows = [
          BoxShadow(
            color: const Color(0xFFFF006E).withOpacity(0.3),
            blurRadius: 8,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ];
        break;
        
      case 'operation':
        textColor = const Color(0xFF06D6A0); // Cyan
        borderColor = const Color(0xFF06D6A0);
        glowColor = const Color(0xFF06D6A0);
        gradient = const LinearGradient(
          colors: [
            Color(0xFF1A1A2E),
            Color(0xFF163A3A),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
        shadows = [
          BoxShadow(
            color: const Color(0xFF06D6A0).withOpacity(0.3),
            blurRadius: 8,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ];
        break;
        
      case 'equals':
        textColor = Colors.white;
        borderColor = const Color(0xFFA855F7);
        glowColor = const Color(0xFFA855F7);
        gradient = const LinearGradient(
          colors: [
            Color(0xFFA855F7),
            Color(0xFF06D6A0),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
        shadows = [
          BoxShadow(
            color: const Color(0xFFA855F7).withOpacity(0.3),
            blurRadius: 15,
            spreadRadius: 3,
            offset: const Offset(0, 3),
          ),
        ];
        break;
        
      case 'number':
      default:
        textColor = Colors.white;
        borderColor = const Color(0xFFA855F7);
        glowColor = const Color(0xFFA855F7);
        gradient = const LinearGradient(
          colors: [
            Color(0xFF121226),
            Color(0xFF1A1A2E),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
        shadows = [
          BoxShadow(
            color: const Color(0xFFA855F7).withOpacity(0.3),
            blurRadius: 8,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ];
        break;
    }

    // Define text shadows based on type
    List<Shadow> textShadows = [];
    if (type == 'equals') {
      textShadows = [
        const Shadow(
          blurRadius: 10,
          color: Color(0xFFA855F7),
        ),
        const Shadow(
          blurRadius: 20,
          color: Color(0xFF06D6A0),
        ),
      ];
    } else {
      textShadows = [
        Shadow(
          blurRadius: 5,
          color: glowColor.withOpacity(0.5),
        ),
      ];
    }

    return Container(
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: gradient,
        border: Border.all(
          color: type == 'clear' || type == 'operation' || type == 'equals'
              ? borderColor
              : borderColor.withOpacity(0.5),
          width: type == 'equals' ? 3 : 2,
        ),
        boxShadow: shadows,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: () {
            appState.calculatorInput(text);
          },
          borderRadius: BorderRadius.circular(16),
          splashColor: glowColor.withOpacity(0.3),
          highlightColor: glowColor.withOpacity(0.2),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 28,
                fontWeight: type == 'equals' ? FontWeight.w900 : FontWeight.w700,
                color: textColor,
                letterSpacing: 1,
                shadows: textShadows,
              ),
            ),
          ),
        ),
      ),
    );
  }
}