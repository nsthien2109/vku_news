class Network{
  String url_host = "";
  String url_local = "http://192.168.43.244/zuzi-blog-api/api";
  String url_image_host = "";
  String url_image_local = "http://192.168.43.244/zuzi-blog-api/public/Upload/BlogImages/";

  String Server(){
    //url_local
    //url_host
    return url_local;
  }

  String ImageUrl (){
    //url_image_host
    //url_image_local
    return url_image_local;
  }
}