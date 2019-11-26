
class Password{
  int id;
  String name;
  String url;
  String type;
  String password;


  Password(this.name, this.url, this.type, this.password);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'url': url,
      'type': type,
      'password': password,
    };
  }
  Password.fromMap(Map map) {
    id = map['id'];
    name = map['name'];
    url = map['url'];
    type = map['type'];
    password = map['password'];
  }
  Password.fromJson(Map<String, dynamic> json)
      :
        name=json['name'],
        url=json['url'],
        type=json['type'],
        password=json['password'],
        id = json['id']
  ;

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'id': id,
        'url': url,
        'type': type,
        'password': password,
      };

}