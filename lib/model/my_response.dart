class MyResponse {
  dynamic data;
  bool? error;
  String? message;
  int? status;

  MyResponse({this.data, this.error, this.message, this.status});

  factory MyResponse.fromJson(Map<String, dynamic> json) {
    return MyResponse(
      data: json['data'],
      error: json['error'],
      message: json['message'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['message'] = message;
    data['status'] = status;
    data['data'] = this.data;
    return data;
  }
}
