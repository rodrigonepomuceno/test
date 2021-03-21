class Emoji {
  int id;
  String name;
  String url;

  Emoji({this.id, this.name, this.url});

  Emoji.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
