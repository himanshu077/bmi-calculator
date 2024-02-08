import 'package:bmi_calculator/services/firebase/FirebaseDBService.dart';

import 'AuthRepo.dart';

class AuthRepoImplementation extends AuthRepo{
 final userCollection =  FirebaseDBService('user','user');



  @override
  Future<Object> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Object> updateProfile() {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }

  @override
  Future<String> login({required String email, required String password}) async{

   try{
    final checkDoc = await userCollection.checkIfDocExist('email', email);

    if(checkDoc.size > 0){
     final snap = checkDoc.docs[0];
     final data = snap.data() as Map<String,dynamic>;
     if(data['password'] == password){
      return snap.id;
     }else{
      throw 'Failed to login! wrong credentials';
     }
    }else{
    final snap = await userCollection.add({
      'email':email,
      'password':password
     });
    return snap.id;
    }
   }catch(e){
    rethrow;
   }
  }
}



