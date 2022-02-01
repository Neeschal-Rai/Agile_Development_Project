
const String BASE_URL = "http://172.26.0.104:90/";
// 172.25.1.122
// 10.1.1.51
// const String BASE_URL = "http://172.26.0.104:90/";
const String REGISTER_URL = "user/register";
const String LOGIN_URL = "user/login";
const String USER_PROFILE_URL = "user/show/";
const String UPDATE_PROFILE_URL = "user/profile/upload/";
const String UPLOAD_SONG_URL = "song/upload";
const String CREATE_PLAYLIST_URL = "create/playlist";
const String GET_PLAYLIST_URL = "playlist/showall";
const String GET_SONG_URL = "song/showall";




String get getRegisterUrl => BASE_URL+REGISTER_URL;
String get getLoginUrl => BASE_URL+LOGIN_URL;
String get getUploadSong => BASE_URL+UPLOAD_SONG_URL;
String get getUserProfile=> BASE_URL+USER_PROFILE_URL;
String get getUpdateProfile => BASE_URL+UPDATE_PROFILE_URL;
String get getCreatePlaylist => BASE_URL+CREATE_PLAYLIST_URL;
String get getPlaylistShowall => BASE_URL+GET_PLAYLIST_URL;
String get getSongsServer => BASE_URL+GET_SONG_URL;
