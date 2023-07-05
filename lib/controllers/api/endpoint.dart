class Endpoint {
  static const _apiUrl = 'https://api-portfolio.gft.academy';
  static const $httpHeader = {"Content-Type": "application/json"};

  static const $$baseUrl = _apiUrl;
  static const $$register = '';
  static const $$login = '$_apiUrl/api/auth/login';

  static const getUser = '$_apiUrl/api/users';
  static const getPosts = '$_apiUrl/api/posts/all';
  static const createPost ='$_apiUrl/api/posts';
  static const updatePost ='$_apiUrl/api/posts';
  // static const updatePost ='$_apiUrl/api/posts';
  // static const deletePost ='$_apiUrl/api/posts/';

  static const getArticles = '$_apiUrl/api/articles/all';

  static const getPostsTimeLine = '$_apiUrl/api/posts/timeline/all';
  static const getArticlesTimeLine = '$_apiUrl/api/articles/timeline/all';
}
