class GoogleRepos {
  int id;
  String nodeId;
  String name;
  String full_name;
  bool private;

  GoogleRepos({this.id, this.nodeId, this.name, this.full_name, this.private});

  GoogleRepos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nodeId = json['node_id'];
    name = json['name'];
    full_name = json['full_name'];
    private = json['private'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['node_id'] = this.nodeId;
    data['name'] = this.name;
    data['full_name'] = this.full_name;
    data['private'] = this.private;
    return data;
  }

  @override
  String toString() {
    return '$id $full_name $name';
  }
}
