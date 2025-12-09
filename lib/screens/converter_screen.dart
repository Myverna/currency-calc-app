// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../data/currencies.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({super.key});

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  String fromCurrency = 'USD';
  String toCurrency = 'EUR';
  double amount = 1.0;
  double result = 0.0;

  @override
  void initState() {
    super.initState();
    _calculate();
  }

  void _calculate() {
    setState(() {
      result = convertCurrency(amount, fromCurrency, toCurrency);
    });
  }

  void _swapCurrencies() {
    setState(() {
      final temp = fromCurrency;
      fromCurrency = toCurrency;
      toCurrency = temp;
      _calculate();
    });
  }

  // Country data for currencies - COMPLETE LIST
  String _getCountryName(String code) {
    const countryNames = {
      'USD': 'United States',
      'EUR': 'Eurozone',
      'GBP': 'United Kingdom',
      'JPY': 'Japan',
      'PHP': 'Philippines',
      'CAD': 'Canada',
      'AUD': 'Australia',
      'SGD': 'Singapore',
      'CHF': 'Switzerland',
      'CNY': 'China',
      'INR': 'India',
      'KRW': 'South Korea',
      'MXN': 'Mexico',
      'NZD': 'New Zealand',
      'RUB': 'Russia',
      'TRY': 'Turkey',
      'ZAR': 'South Africa',
      'MYR': 'Malaysia',
      'THB': 'Thailand',
      'IDR': 'Indonesia',
      'VND': 'Vietnam',
      'AED': 'United Arab Emirates',
      'SAR': 'Saudi Arabia',
      'QAR': 'Qatar',
      'BRL': 'Brazil',
      'ARS': 'Argentina',
      'CLP': 'Chile',
      'COP': 'Colombia',
      'PEN': 'Peru',
      'UYU': 'Uruguay',
      'EGP': 'Egypt',
      'NGN': 'Nigeria',
      'KES': 'Kenya',
      'GHS': 'Ghana',
      'DKK': 'Denmark',
      'NOK': 'Norway',
      'SEK': 'Sweden',
      'PLN': 'Poland',
      'CZK': 'Czech Republic',
      'HUF': 'Hungary',
      'RON': 'Romania',
      'HRK': 'Croatia',
      'BGN': 'Bulgaria',
      'ILS': 'Israel',
      'PKR': 'Pakistan',
      'BDT': 'Bangladesh',
      'LKR': 'Sri Lanka',
      'NPR': 'Nepal',
    };
    return countryNames[code] ?? code;
  }

  // SIMPLE dropdown item - NO OVERFLOW
  DropdownMenuItem<String> _buildDropdownItem(String code) {
    final countryName = _getCountryName(code);
    return DropdownMenuItem<String>(
      value: code,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          '$code - $countryName',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF0A0A0F),
            Color(0xFF121226),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFA855F7), Color(0xFF06D6A0)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    const Text(
                      '💱 CURRENCY CONVERTER',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'REAL-TIME CONVERSION',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ),

              // Amount Input
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A2E),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'AMOUNT',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFFA855F7),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Enter amount...',
                        hintStyle: TextStyle(
                          color: const Color(0xFF94A3B8).withOpacity(0.7),
                        ),
                        filled: true,
                        fillColor: const Color(0xFF121226),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: const Color(0xFFA855F7).withOpacity(0.5),
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                      controller: TextEditingController(text: amount.toString()),
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          setState(() {
                            amount = double.parse(value);
                            _calculate();
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),

              // Currency Selection - NO OVERFLOW
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A2E),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    // From Currency
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'FROM',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF06D6A0),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF121226),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xFFA855F7).withOpacity(0.5),
                            ),
                          ),
                          child: DropdownButton<String>(
                            value: fromCurrency,
                            isExpanded: true,
                            underline: const SizedBox(),
                            icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF06D6A0)),
                            dropdownColor: const Color(0xFF1A1A2E),
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            items: currencyRates.keys.map(_buildDropdownItem).toList(),
                            onChanged: (value) {
                              setState(() {
                                fromCurrency = value!;
                                _calculate();
                              });
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Swap Button
                    Center(
                      child: IconButton(
                        onPressed: _swapCurrencies,
                        icon: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFFA855F7), Color(0xFF06D6A0)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.swap_vert,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // To Currency
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'TO',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF06D6A0),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF121226),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xFFA855F7).withOpacity(0.5),
                            ),
                          ),
                          child: DropdownButton<String>(
                            value: toCurrency,
                            isExpanded: true,
                            underline: const SizedBox(),
                            icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF06D6A0)),
                            dropdownColor: const Color(0xFF1A1A2E),
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            items: currencyRates.keys.map(_buildDropdownItem).toList(),
                            onChanged: (value) {
                              setState(() {
                                toCurrency = value!;
                                _calculate();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Conversion Result
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFA855F7), Color(0xFF06D6A0)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    // Horizontal layout
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // From
                        Column(
                          children: [
                            Text(
                              fromCurrency,
                              style: const TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              amount.toStringAsFixed(2),
                              style: const TextStyle(
                                fontSize: 18,
                                color: Color(0xFFA855F7),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),

                        // Arrow
                        const Icon(
                          Icons.arrow_forward,
                          color: Color(0xFF06D6A0),
                          size: 28,
                        ),

                        // To
                        Column(
                          children: [
                            Text(
                              toCurrency,
                              style: const TextStyle(
                                fontSize: 22,
                                color: Color(0xFF06D6A0),
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              result.toStringAsFixed(2),
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Exchange Rate
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '1 $fromCurrency = ${(currencyRates[toCurrency]! / currencyRates[fromCurrency]!).toStringAsFixed(4)} $toCurrency',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}