class CurrencyModel {
  final String imageUrl;
  final String title;
  final String subtitle;
  final int money;

  CurrencyModel({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.money,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
      imageUrl: json['image'],
      title: json['title'],
      subtitle: json['subtitle'],
      money: json['money']);
}
