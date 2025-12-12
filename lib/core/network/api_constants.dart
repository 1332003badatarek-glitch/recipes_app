class ApiConstants {
  //BASE URL
  static const baseUrl = 'https://dummyjson.com/';

  //end points
  static const String login = 'auth/login';
  static const String recipes = 'recipes';

  //query param

  static const String limit = 'limit';
  static const String skip = 'skip';

  //headerws keys

  static const String contentType = 'application/json';
  static const String authorization = 'Authorization';

  //map keys
  static const String userName = 'username';
  static const String password = 'password';

  //dio factory

  static const String dioPublic = 'public';
  static const String dioAuthorized = 'authorized';

  ApiConstants._();
}
