class Post {
  String? fullname;
  String? mobile;
  String? id;

  Post({
    this.id,
    this.fullname,
    this.mobile,
  });

  Post.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        fullname = json['fullname'],
        mobile = json['mobile'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullname': fullname,
        'mobile': mobile,
      };

  @override
  String toString() {
    return 'Post{fullname: $fullname, mobile: $mobile, id: $id}';
  }
}
