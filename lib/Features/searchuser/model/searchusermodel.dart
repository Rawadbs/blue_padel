class usermodel {
  String name;
  int id;
  int current_session;
  String phone;
  usermodel({
    required this.name,
    required this.id,
    required this.current_session,
    required this.phone,
  });

  factory usermodel.fromJson(Map<String, dynamic> json) {
    return usermodel(
      name: json['name'],
      id: json['id'],
      current_session: json['current_session'],
      phone: json['phone'],
    );
  }
  
}