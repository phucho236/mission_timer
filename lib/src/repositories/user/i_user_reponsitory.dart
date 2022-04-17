

abstract class IUserRepository {
  Future<bool>? updateProfile(
      {String? address,
      String? phone,
       String? pathAvatar,
      required Function(List<String>) callbackUpdate});
  Future<bool>? postFile({
    String path,
  });
}
