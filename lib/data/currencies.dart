// Updated exchange rates from API (March 2024)
final Map<String, double> currencyRates = {
  // Americas
  'USD': 1.0,        // US Dollar
  'CAD': 1.35,       // Canadian Dollar
  'MXN': 16.85,      // Mexican Peso
  'BRL': 4.98,       // Brazilian Real
  'ARS': 845.0,      // Argentine Peso
  'CLP': 950.0,      // Chilean Peso
  
  // Europe
  'EUR': 0.92,       // Euro
  'GBP': 0.79,       // British Pound
  'CHF': 0.88,       // Swiss Franc
  'RUB': 91.5,       // Russian Ruble
  'TRY': 31.85,      // Turkish Lira
  'PLN': 3.98,       // Polish Złoty
  'SEK': 10.42,      // Swedish Krona
  'NOK': 10.65,      // Norwegian Krone
  'DKK': 6.88,       // Danish Krone
  'HUF': 362.0,      // Hungarian Forint
  'CZK': 23.15,      // Czech Koruna
  
  // Asia
  'JPY': 150.25,     // Japanese Yen
  'CNY': 7.19,       // Chinese Yuan
  'INR': 82.95,      // Indian Rupee
  'KRW': 1328.0,     // South Korean Won
  'PHP': 56.25,      // Philippine Peso - ADDED!
  'SGD': 1.34,       // Singapore Dollar
  'MYR': 4.73,       // Malaysian Ringgit
  'THB': 36.35,      // Thai Baht
  'IDR': 15680.0,    // Indonesian Rupiah
  'VND': 24720.0,    // Vietnamese Dong
  'TWD': 31.45,      // New Taiwan Dollar
  'HKD': 7.82,       // Hong Kong Dollar
  'BDT': 109.5,      // Bangladeshi Taka
  'PKR': 278.5,      // Pakistani Rupee
  'LKR': 305.0,      // Sri Lankan Rupee
  
  // Middle East
  'AED': 3.67,       // UAE Dirham
  'SAR': 3.75,       // Saudi Riyal
  'QAR': 3.64,       // Qatari Riyal
  'ILS': 3.65,       // Israeli Shekel
  'KWD': 0.307,      // Kuwaiti Dinar
  
  // Africa
  'ZAR': 18.85,      // South African Rand
  'EGP': 30.88,      // Egyptian Pound
  'NGN': 1595.0,     // Nigerian Naira
  'KES': 159.5,      // Kenyan Shilling
  'GHS': 12.85,      // Ghanaian Cedi
  'MAD': 10.05,      // Moroccan Dirham
  
  // Oceania
  'AUD': 1.52,       // Australian Dollar
  'NZD': 1.62,       // New Zealand Dollar
  
  // Other
  'XAU': 0.00048,    // Gold (ounce)
  'XAG': 0.042,      // Silver (ounce)
};

final Map<String, String> currencyNames = {
  'USD': 'US Dollar',
  'EUR': 'Euro',
  'GBP': 'British Pound',
  'JPY': 'Japanese Yen',
  'CAD': 'Canadian Dollar',
  'AUD': 'Australian Dollar',
  'CHF': 'Swiss Franc',
  'CNY': 'Chinese Yuan',
  'INR': 'Indian Rupee',
  'KRW': 'South Korean Won',
  'PHP': 'Philippine Peso',
  'SGD': 'Singapore Dollar',
  'MYR': 'Malaysian Ringgit',
  'THB': 'Thai Baht',
  'IDR': 'Indonesian Rupiah',
  'VND': 'Vietnamese Dong',
  'TWD': 'New Taiwan Dollar',
  'HKD': 'Hong Kong Dollar',
  'AED': 'UAE Dirham',
  'SAR': 'Saudi Riyal',
  'QAR': 'Qatari Riyal',
  'MXN': 'Mexican Peso',
  'BRL': 'Brazilian Real',
  'ARS': 'Argentine Peso',
  'RUB': 'Russian Ruble',
  'TRY': 'Turkish Lira',
  'PLN': 'Polish Złoty',
  'CZK': 'Czech Koruna',
  'HUF': 'Hungarian Forint',
  'ZAR': 'South African Rand',
  'EGP': 'Egyptian Pound',
  'NGN': 'Nigerian Naira',
  'KES': 'Kenyan Shilling',
  'NZD': 'New Zealand Dollar',
  'SEK': 'Swedish Krona',
  'NOK': 'Norwegian Krone',
  'DKK': 'Danish Krone',
  'BDT': 'Bangladeshi Taka',
  'PKR': 'Pakistani Rupee',
  'LKR': 'Sri Lankan Rupee',
  'ILS': 'Israeli Shekel',
  'KWD': 'Kuwaiti Dinar',
  'CLP': 'Chilean Peso',
  'GHS': 'Ghanaian Cedi',
  'MAD': 'Moroccan Dirham',
  'XAU': 'Gold (ounce)',
  'XAG': 'Silver (ounce)',
};

// Simple conversion function
double convertCurrency(double amount, String from, String to) {
  if (!currencyRates.containsKey(from) || !currencyRates.containsKey(to)) {
    return 0.0;
  }
  // Convert to USD first, then to target
  double amountInUSD = amount / currencyRates[from]!;
  return amountInUSD * currencyRates[to]!;
}