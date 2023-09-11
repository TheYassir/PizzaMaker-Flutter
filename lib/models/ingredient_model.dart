class IngredientModel {
  int id;
  String category;
  String name;
  String image;

  IngredientModel(
      {required this.id,
      required this.category,
      required this.name,
      required this.image});

  factory IngredientModel.fromJson(Map<String, dynamic> json) {
    return IngredientModel(
      id: json['id'],
      category: json['category'],
      name: json['name'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'category': category,
        'name': name,
        'image': image,
      };
}
