class PracticedDetailModel {
  String? message;

  PracticedDetailModel({ this.message});

  PracticedDetailModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

}
