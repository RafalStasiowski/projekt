class AvilableProduct {
  String name;
  String description;
  double price;

  AvilableProduct({String name, String description, double price}) {
    this.name = name;
    this.description = description;
    this.price = price;
  }

  factory AvilableProduct.fromJson(dynamic json) {
    return AvilableProduct(
        name: json['name'] as String,
        description: json['descriprion'],
        price: json['price'] as double,
    );
  }
}