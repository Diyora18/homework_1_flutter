class OnBoardingModel{
  final int id;
  final String image;
  OnBoardingModel({required this.id, required this.image});

 factory OnBoardingModel.fromJson(Map<String, dynamic> json){
   return OnBoardingModel(
   id: json['id'],
  image: json['image'],
   );
  }
}