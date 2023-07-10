class Post {
  var id, userId, title, desc, isPublic, createdAt, updatedAt;
  var comments = [];

  // comments nanti dulu
  Post.instance({
    this.id,
    this.userId,
    this.desc,
    this.isPublic,
    this.createdAt,
    this.updatedAt,
    required this.comments,
  });

  Post();

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post.instance(
      id: json['_id'],
      userId: json['userId'],
      desc: json['desc'],
      isPublic: json['isPublic'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      comments: (json['comments'] as List<dynamic>)
          .map((e) => Comment.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'desc': desc,
      'isPublic': isPublic,
      // 'comments': comments.map((e) => e.toJson().toList()),
    };
  }

  @override
  String toString() {
    return 'GetPosts{id: $id, userId: $userId, desc: $desc, isPublic: $isPublic, createdAt: $createdAt, updatedAt: $updatedAt, comments: $comments}';
  }
}

class Comment {
  var id, userId, comment, date;

  Comment.instance({
    this.id,
    this.userId,
    this.comment,
    this.date,
  });

  Comment();

  @override
  String toString() {
    return 'Comment{id: $id, userId: $userId, comment: $comment, date: $date}';
  }

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment.instance(
      id: json['_id'],
      userId: json['userId'],
      comment: json['comment'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userId': userId,
      'comment': comment,
      'date': date,
    };
  }
}
