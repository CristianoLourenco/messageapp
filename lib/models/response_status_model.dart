class ResponseStatusModel {
  final int statusCode;
  final String message;

  ResponseStatusModel({
    this.statusCode =  404,
    this.message = "not Found",
  });
}
