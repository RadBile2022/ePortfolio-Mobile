class Article {
  var id, userId, title, desc, coverArticle, isPublic;
  var tags = [];
  var createdAt, updatedAt;

  var comments = [];

  // comments nanti dulu
  Article.instance({
    this.id,
    this.userId,
    this.title,
    this.desc,
    this.coverArticle,
    this.isPublic,
    required this.tags,
    this.createdAt,
    this.updatedAt,
    required this.comments,
  });

  Article();

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article.instance(
      id: json['_id'],
      userId: json['userId'],
      title: json['title'],
      desc: json['desc'],
      coverArticle: json['coverArticle'],
      isPublic: json['isPublic'],
      tags: json['tags'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      comments: (json['comments'] as List<dynamic>)
          .map((e) => Comment.fromJson(e))
          .toList(),

    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userId': userId,
      'title' : title,
      'desc': desc,
      'coverArticle' : coverArticle,
      'isPublic': isPublic,
      'tags': tags,
    };
  }

  @override
  String toString() {
    return 'GetArticles{id: $id, userId: $userId, title: $title, desc: $desc, coverArticle: $coverArticle, isPublic: $isPublic, tags: $tags, createdAt: $createdAt, updatedAt: $updatedAt, comments: $comments}';
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