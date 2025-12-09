import 'package:flutter/material.dart';

// Simple state management - no complex currency objects
class AppState extends ChangeNotifier {
  // For Converter Screen
  double converterAmount = 1.0;
  String fromCurrency = 'USD';
  String toCurrency = 'EUR';
  
  // For Calculator Screen
  String calculatorDisplay = '0';
  String calculatorMemory = '0';
  String calculatorOperation = '';
  double calculatorFirstNumber = 0;
  
  // Converter methods
  void updateConverterAmount(double newAmount) {
    converterAmount = newAmount;
    notifyListeners();
  }
  
  void setFromCurrency(String currency) {
    fromCurrency = currency;
    notifyListeners();
  }
  
  void setToCurrency(String currency) {
    toCurrency = currency;
    notifyListeners();
  }
  
  void swapCurrencies() {
    final temp = fromCurrency;
    fromCurrency = toCurrency;
    toCurrency = temp;
    notifyListeners();
  }
  
  // Calculator methods
  void calculatorInput(String input) {
    if (input == 'C') {
      calculatorDisplay = '0';
      calculatorOperation = '';
      calculatorFirstNumber = 0;
    } else if (input == '⌫') {
      if (calculatorDisplay.length > 1) {
        calculatorDisplay = calculatorDisplay.substring(0, calculatorDisplay.length - 1);
      } else {
        calculatorDisplay = '0';
      }
    } else if (input == '=') {
      _calculate();
    } else if (['+', '-', '×', '÷', '%'].contains(input)) {
      calculatorFirstNumber = double.parse(calculatorDisplay);
      calculatorOperation = input;
      calculatorDisplay = '0';
    } else if (input == '.') {
      if (!calculatorDisplay.contains('.')) {
        calculatorDisplay += '.';
      }
    } else {
      calculatorDisplay = calculatorDisplay == '0' ? input : calculatorDisplay + input;
    }
    notifyListeners();
  }
  
  void _calculate() {
    final secondNumber = double.parse(calculatorDisplay);
    double result = 0;
    
    switch (calculatorOperation) {
      case '+':
        result = calculatorFirstNumber + secondNumber;
        break;
      case '-':
        result = calculatorFirstNumber - secondNumber;
        break;
      case '×':
        result = calculatorFirstNumber * secondNumber;
        break;
      case '÷':
        result = secondNumber != 0 ? calculatorFirstNumber / secondNumber : 0;
        break;
      case '%':
        result = calculatorFirstNumber * (secondNumber / 100);
        break;
    }
    
    calculatorDisplay = _formatResult(result);
    calculatorOperation = '';
    notifyListeners();
  }
  
  String _formatResult(double result) {
    if (result == result.truncateToDouble()) {
      return result.toInt().toString();
    }
    return result.toStringAsFixed(2);
  }
}