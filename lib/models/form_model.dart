class FormModel {
  String description;
  String age;
  int duration;
  String gender;
  bool isImage;
  String url;
  String? id;

  FormModel({
    required this.description,
    required this.age,
    required this.duration,
    required this.gender,
    required this.isImage,
    required this.url,
  });

  factory FormModel.fromJson(Map<String, dynamic> json) => FormModel(
        description: json['description'] as String,
        age: json['age'] as String,
        duration: json['duration'] ?? 0,
        gender: json['gender'] as String,
        isImage: json['isImage'] as bool,
        url: json['url'] as String,
      );

  Map<String, dynamic> toJson() => {
        'description': description,
        'age': age,
        'duration': duration,
        'gender': gender,
        'isImage': isImage,
        'url': url,
      };
  void setId(String id) {
    this.id = id;
  }
}
