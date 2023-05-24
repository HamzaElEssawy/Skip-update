class AppContact{
  const AppContact(this.name, this.phone, this.imageUrl);

  final String name;
  final String phone;
  final String imageUrl;

  AppContact.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      phone = json['phone'],
      imageUrl = json['imageUrl'];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'imageUrl': imageUrl,
    };
  }
}
