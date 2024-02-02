import 'package:akdmvisitorsapp/core/api_client.dart';
import 'package:async/async.dart';
import 'package:injectable/injectable.dart';

abstract class ValidateApiRepository {
  Future<Result<bool>> getToken();
  Future<Result<bool>> getLogout();
}

@Injectable(as: ValidateApiRepository)
class ValidateApiRepositoryImpl implements ValidateApiRepository{

  ValidateApiRepositoryImpl(this.client);
  ApiClient client;

  @override
  Future<Result<bool>> getToken() async {
    var response =  await client.validate();
    if(response == 200) {
      return Result.value(true);
    }else{
      return Result.error(false);
    }
  }

  @override
  Future<Result<bool>> getLogout() async {
    try {
      var response  = await client.logout();
      if (response == 200) {
        return Result.value(true);
      }else{
        return Result.value(false);
      }
    } catch(e){
      return  Result.value(false);
    }
  }
}
