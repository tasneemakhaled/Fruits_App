import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fruit_app/core/utils/constants.dart';
import 'package:meta/meta.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());
  Dio dio=Dio();
  Future<void>updateProfile({required String name,required String phone,required String email})async{
      String? token = await storage.read(key: 'user_token');
      String? userId = await storage.read(key: 'user_id');
emit(UpdateProfileLoading());
var res=await dio.post('$baseUrl/update_profile/$userId',data: {
'name':name,
'mobile':phone,
'email':email,
},options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
          // لا تحتاجي لتعريف Content-Type هنا، Dio سيتعرف عليه تلقائياً كـ multipart
        },
      ),);
if(res.statusCode==200){
  emit(UpdateProfileSuccess());
}else{
  emit(UpdateProfileFailure());
}
  }
}
