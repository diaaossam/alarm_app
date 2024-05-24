class ApiConfigData {
  static const int ok = 200;
  static const int badRequest = 400;
  static const int badResponse = 422;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int conflict = 409;
  static const int internalServerError = 500;


  static const String connectionTimeOut = "Connection Time out with server";
  static const String badCertificate = "Bad Certificate with server";
  static const String canceledRequest = "Canceled Request with server";
  static const String connectionError = "No Internet connection";
  static const String unknownError = "Opps there was an error , please try again";
}
