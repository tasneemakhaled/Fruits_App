import 'package:dio/dio.dart';
import 'package:fruit_app/core/utils/constants.dart';

class GetProductsService {
  Dio dio = Dio();
  Future<void> getProducts() async {
    try {
      var res = await dio.get('$baseUrl/product/get/ar');
      if (res.statusCode == 200) {}
    } on Exception catch (e) {
      // TODO
    }
  }
}
