abstract class AuthRepo{
  Future<Object> login({required String email, required String password});
  Future<Object> updateProfile();
  Future<Object> logout();
}