import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fruit_app/core/utils/constants.dart';
import 'package:meta/meta.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit() : super(ContactUsInitial());
  Dio dio=Dio();
  Future<void>contact({required String name,required String message,required String phone})async{
    emit(ContactUsLoading());
    var res=await dio.post('$baseUrl/contact_us',queryParameters: {
          'name': name,
          'message': message,
          'mobile': phone, // تأكدي أن المفتاح اسمه mobile كما في الصورة
        },);
    if(res.statusCode==200){
      emit(ContactUsSuccess());
      
    }else{
      emit(ContactUsFailure());
    }
  }
}
