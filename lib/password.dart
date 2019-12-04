
class Password{
  int id;
  String name;
  String url;
  String type;
  String password;
  String icon;
  int star;
  Password(this.name, this.url, this.type, this.password,this.icon,this.star);


  Password.name(this.id, this.name, this.url, this.type, this.password,
      this.icon, this.star);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'url': url,
      'type': type,
      'password': password,
      'icon': icon,
      'star': star
    };
  }
  Password.fromMap(Map map) {
    id = map['id'];
    name = map['name'];
    url = map['url'];
    type = map['type'];
    password = map['password'];
    icon = map['icon'];
    star = map['star'];
  }
  Password.fromJson(Map<String, dynamic> json)
      :
        name=json['name'],
        url=json['url'],
        type=json['type'],
        password=json['password'],
        id = json['id'],
        icon = json['icon'],
        star = json['star']
  ;

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'id': id,
        'url': url,
        'type': type,
        'password': password,
        'icon': icon,
        'star': star
      };

}