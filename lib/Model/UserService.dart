class HaadreenList {
  String id;
  String category;
  String iCONS;

  HaadreenList({this.id, this.category, this.iCONS});

  HaadreenList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    iCONS = json['ICONS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category'] = this.category;
    data['ICONS'] = this.iCONS;
    return data;
  }
}

List<HaadreenList> user = new List<HaadreenList>();
String myUrl = "http://192.168.8.134/WS_XPLODE/WS.asmx/General";
