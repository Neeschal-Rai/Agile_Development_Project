
const String BASE_URL = "http://192.168.1.69:90/";
// 172.25.1.122
// 10.1.1.51
// const String BASE_URL = "http://192.168.1.72:90/";
const String REGISTER_URL = "user/register";
const String LOGIN_URL = "user/login";
const String USER_PROFILE_URL = "user/show/";
const String UPLOAD_SONG_URL = "song/upload";


String get getRegisterUrl => BASE_URL+REGISTER_URL;
String get getLoginUrl => BASE_URL+LOGIN_URL;
String get getUploadSong => BASE_URL+UPLOAD_SONG_URL;
String get getUserProfile=> BASE_URL+USER_PROFILE_URL;
