

class CourseModel {
  CourseModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.img,
    required this.schedule,
    required this.discounts,
    required this.type,

  });

  String id;
  String title;
  String description;
  String schedule;
  String discounts;
  String price;
  String img;
  String type;


  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
    id: json["id"],
    title: json["title"],
    schedule: json["schedule"],
    description: json["description"],
    discounts: json["discounts"],
    price: json["price"],
    img: json['img'],
    type: json['type'],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "schedule": schedule,
    "description": description,
    "discounts": discounts,
    "price": price,
    'img': img,
    'type': type,
  };
}