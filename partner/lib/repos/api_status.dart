class ApiResponse{
  // int code;
  String body;
  ApiResponse({required this.body});
}

class Success extends ApiResponse{
  Success({required String body}): super(body: body);
}

class Failure extends ApiResponse{
  int code;
  Failure({required this.code, required String errorResponse}): super(body: errorResponse);
}

// class Success{
//   Object response;
//   Success({required this.response});
// }
// class Failure{
//   int code;
//   String errorResponse;
//   Failure({required this.code, required this.errorResponse});
// }
