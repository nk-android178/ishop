

class FocusModel {
  String sId;
  String title;
  String status;
  String pic;
  String url;

  FocusModel({this.sId,this.title,this.status,this.pic,this.url});

  FocusModel.fromJson(Map jsonData){
    this.sId = jsonData["_id"];
    this.title = jsonData["title"];
    this.status = jsonData["status"];
    this.pic = jsonData["pic"];
    this.url = jsonData["url"];
  }
}