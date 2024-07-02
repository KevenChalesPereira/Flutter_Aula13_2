class DadosJSON {
  String s1 = '';
  String s2 = '';
  String s3 = '';

  DadosJSON({this.s1 = '', this.s2 = '', this.s3 = ''});

  DadosJSON.fromJson(Map<String, dynamic> json) {
    s1 = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1'] = this.s1;

    return data;
  }
}
