class VideoModel {
  String description;
  String age;
  String gender;
  bool isImage;
  String url;
  String? id;
  VideoModel({
    required this.description,
    required this.age,
    required this.gender,
    required this.isImage,
    required this.url,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        description: json['description'] as String,
        age: json['age'] as String,
        gender: json['gender'] as String,
        isImage: json['isImage'] as bool,
        url: json['url'] as String,
      );

  Map<String, dynamic> toJson() => {
        'description': description,
        'age': age,
        'gender': gender,
        'isImage': isImage,
        'url': url,
      };
  void setId(String id) {
    this.id = id;
  }
}
