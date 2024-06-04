class NewsModel {
  String? category;
  List<Data>? data;
  bool? success;


  NewsModel(Map<String, dynamic> json) {
    category = json['category'];
    success=json["success"];
    data=[];
    if(json["data"]!=null){
      json["data"].forEach((mapObject){
        Data dataObj=Data(mapObject);
        data!.add(dataObj);
      });
    }
  }  
}

 

class Data {
  String? author;
  String? content;
  String? date;
  String? id;
  String? imageUrl;
  String? readMoreUrl;
  String? time;
  String? title;
  String? url;

 

  Data(Map<String, dynamic> json) {
    author = json['author'];
    content = json['content'];
    date = json['date'];
    id = json['id'];
    imageUrl = json['imageUrl'];
    readMoreUrl = json['readMoreUrl'];
    time = json['time'];
    title = json['title'];
    url = json['url'];
  }
}
