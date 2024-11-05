class AppConstant {
  static String baseUrl = "https://api.themoviedb.org/3" ;
  static String nowPlayingEndPoint = "/movie/now_playing" ;
  static String popularEndPoint = "/movie/popular" ;
  static String topRatedEndPoint = "/movie/top_rated" ;
  static String apiKey = "c91441649cfcad4f3f7e48b23b02d610" ;
  static String baseImageUrl = "https://image.tndb.org/t/p/w500" ;
  static String imageUrl(String path)=> '$baseImageUrl$path';
}