class Path {
  static const login = '/user/staff/login';
  static const firstChangePass = '/user/password';
  static const changePass = '/user/password/change-pass-otp';
  static const updateProfile = '/user/updateprofile';
  static const uploadAvatar = '/user/avatar';
  static const tasks = '/task/me';
  static acceptTask(String id) => '/participant/answers/$id';
  static const getProfile = '/user/me';
  static const getNotification = '/notification/me';
  static const forgotPassword = '/user/password/forgot-password';
  static const verifyOPT = '/user/password/check-otp';
  static const getYear = '/year';
  static const getStatistical = '/statistical/user';
  static updateReadedNoti(String id) => '/notification/seen/$id';
}
