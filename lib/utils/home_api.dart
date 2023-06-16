import 'package:api_demo/Model/photo_model.dart';
import 'package:api_demo/Model/product_model.dart';
import 'package:api_demo/Services/http_service.dart';
import 'package:api_demo/utils/endpointRes.dart';
import 'package:http/http.dart' as http;

class HomeScreenApi{
  static Future getData() async {
    try{
      http.Response? response = await HttpServices.getApi(url: EndPointRes.photosEndPoint);
      if(response!=null && response.statusCode==200){
        return imageModelFromJson(response.body);
      }
    }catch(e){
      print(e);
      return null;
    }
  }
  static Future addData() async{
    try{
      http.Response? response = await HttpServices.getApi(url: EndPointRes.productEndPoint);
      if(response!=null && response.statusCode==200){
        return productsModelFromJson(response.body);
      }
    }catch(e){
      print(e);
      return null;
    }
  }

}
