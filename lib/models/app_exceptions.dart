class AppException implements Exception {
  final String message;
  String? prefix;
  AppException({
    required this.message,
    this.prefix,
  });

  @override
  String toString() => "$prefix$message";
}

class FetchDataException extends AppException {
  FetchDataException({
    required super.message,
    super.prefix = "Error During Communication: ",
  });
}

class BadRequestException extends AppException {
  BadRequestException({
    required super.message,
    super.prefix = "Invalid Request: ",
  });
}

class UnauthorisedException extends AppException {
  UnauthorisedException({
    required super.message,
    super.prefix = "Unauthorised: ",
  });
}

class InvalidInputException extends AppException {
  InvalidInputException({
    required super.message,
    super.prefix = "Invalid Input: ",
  });
}
