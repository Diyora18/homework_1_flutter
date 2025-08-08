class CuisinesModel {
  final int id;
  final String title;
  final String image;

  CuisinesModel({required this.id, required this.title, required this.image});

  factory CuisinesModel.fromJson(Map<String, dynamic> json) {
    return CuisinesModel(
      id: json['id'],

      title: json['title'],
      image: json['image'],
    );
  }
}
