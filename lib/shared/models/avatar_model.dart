class Avatar {
  String login;
  int id;
  String avatar_url;
  String gravatarId;
  String name;

  Avatar({
    this.login,
    this.id,
    this.avatar_url,
    this.gravatarId,
    this.name,
  });

  Avatar.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    id = json['id'];
    avatar_url = json['avatar_url'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['id'] = this.id;
    data['avatar_url'] = this.avatar_url;
    data['name'] = this.name;
    return data;
  }

  @override
  String toString() {
    return '$login $id $avatar_url';
  }
}
