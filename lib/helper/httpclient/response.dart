class QAException<T> implements Exception {
  final T error;
  const QAException({required this.error});

  @override
  String toString() {
    return 'DecloException: $error';
  }
}

class QAResponse {
  static final int notFound = 404;
  static final int notAuthentication = 401;
  static final int forbidden = 403;
  static final int badRequest = 400;
  static final int errorServer = 500;
  static final int maintenanceServer = 503;
  static final int success = 200;
  static final int requestTimeout = 408;
  static final int serverCalculating = 429;
  static final int noInternet = 12004;

  int statusCode;
  String message;
  dynamic data;

  QAResponse({required this.statusCode, this.message = '', this.data});

  static String checkMessage(int statusCode) {
    switch (statusCode) {
      case 404:
        return 'Can not found data';
      case 401:
        return 'Not authentication';
      case 403:
        return 'Forbidden';
      case 400:
        return 'Bad request';
      case 500:
        return 'Something is wrong here';
      case 503:
        return 'Maintenance server';
      case 200:
        return 'Fetch data success';
      case 408:
        return 'Request time out';
      case 429:
        return 'Server Calculating';
      case 12004:
        return 'No connect internet';
      default:
        return 'An unknown error';
    }
  }
}
