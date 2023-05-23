import 'package:cosmatics_app/utils/constant.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String
      token; //when dealing with server we need a token and it should be initialized at the begining
  final String appBaseUrl;

  late Map<String, String> _mainHeaders; //
  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl; //has to do with getx package managment
    timeout = const Duration(seconds: 30);
    token=AppConstants.TOKEN; //will wait 30 se for data to get
    _mainHeaders = {//headers are important to communicate with the server the same info are sent everytime so we make this line
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
  }
//insted of http respons we are using getx respons
  Future<Response> getData(String uri)async{
    try{
Response response=await get(uri);
return response;
    }catch(e){
      return Response(statusCode: 1,statusText: e.toString());
    }
  }
}
