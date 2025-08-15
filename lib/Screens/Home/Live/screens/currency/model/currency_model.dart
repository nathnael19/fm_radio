class CurrencyModel {
  final String imageUrl;
  final String title;
  final String subtitle;
  final double money;
  final bool hasError;

  CurrencyModel({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.money,
    this.hasError = false,
  });
}
