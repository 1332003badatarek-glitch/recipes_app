class LocalStatusCode {
  LocalStatusCode._();

  // Networking errors
  static const int success = 200;
  static const int connectionTimeout = 1000;
  static const int sendTimeout = 1001;
  static const int receiveTimeout = 1002;
  static const int badCertificate = 1003;
  static const int cancelled = 1004;
  static const int connectionError = 1005;
  static const int badResponse = 1006;

  // Unknown Dio Error
  static const int unknownError = 1099;
}
