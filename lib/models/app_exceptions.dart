class AppException implements Exception {
  final String message;
  final int code;
  String? prefix;

  AppException({
    required this.message,
    required this.code,
    this.prefix,
  });

  @override
  String toString() => "$prefix$message";
}

class FetchDataException extends AppException {
  FetchDataException({
    required super.message,
    required super.code,
    super.prefix = "Error During Communication: ",
  });
}

class BadRequestException extends AppException {
  BadRequestException({
    required super.message,
    required super.code,
    super.prefix = "Invalid Request: ",
  });
}

class UnauthorisedException extends AppException {
  UnauthorisedException({
    required super.message,
    required super.code,
    super.prefix = "Unauthorised: ",
  });
}

class InvalidInputException extends AppException {
  InvalidInputException({
    required super.message,
    required super.code,
    super.prefix = "Invalid Input: ",
  });
}
