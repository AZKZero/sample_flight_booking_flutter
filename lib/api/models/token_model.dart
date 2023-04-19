class TokenModel {
  String? accessToken;

  TokenModel({ this.accessToken });

  TokenModel.fromJson(Map<String, dynamic> json){
      accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    return data;
  }
}