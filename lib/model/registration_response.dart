class RegistrationResponse{
  dynamic message;
  int? code;
  bool? isError;
  dynamic data;

  RegistrationResponse({
    required this.message,
    required this.code,
    required this.isError,
    required this.data,
  });

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) => RegistrationResponse(
    message: json["message"],
    code: json["code"],
    isError: json["isError"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "code": code,
    "isError": isError,
    "data": data,
  };
}