class Path {
  static const login = '/user/staff/login';
  static const firstChangePass = '/user/password';
  static const updateProfile = '/user/updateprofile';
  static const uploadAvatar = '/user/avatar';
  static const tasks = '/task/me';
  static  acceptTask(String id) => '/participant/answers/$id';
}
