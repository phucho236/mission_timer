abstract class IUserRepository {
  Future<bool>? updateProfile({
    String? address,
    String? phone,
  });
  // Future<bool>? postFile({
  //   String path,
  // });
  Future<bool>? updateAvatar(
      {String? path, required Function(List<String>) callbackUpdate});
      Future<bool>? getActivity(
      {String? path, required Function(List<String>) callbackUpdate});
}
