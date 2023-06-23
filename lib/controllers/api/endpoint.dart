class Endpoint {
  static const _apiUrl = 'https://api-portfolio.gft.academy';
  static const $httpHeader = {"Content-Type": "application/json"};

  static const $$baseUrl = _apiUrl;
  static const $$register = '';
  static const $$login = '$_apiUrl/api/auth/login';

  static const getUser = '$_apiUrl/api/users';
  static const getPosts = '$_apiUrl/api/posts/all';
}
