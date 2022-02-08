const String BASE_URL = "http://192.168.1.69:90/";
// 172.25.1.122v
// 10.1.1.51
// const String BASE_URL = "http://172.26.0.104:90/";
const String REGISTER_URL = "user/register";
const String LOGIN_URL = "user/login";
const String USER_PROFILE_URL = "user/show/";
const String UPDATE_PROFILE_URL = "user/profile/upload/";
const String UPDATE_PROFILE_URL_WITHOUT_IMAGE = "user/update/";
const String UPLOAD_SONG_URL = "song/upload";
const String CREATE_PLAYLIST_URL = "create/playlist";
const String GET_PLAYLIST_URL = "playlist/showall";
const String GET_SONG_URL = "song/showall";
const String GET_SELECTED_SONG_URL = "song/show/";
const String ADD_TO_FAVORITES_URL = "song/favorite/";
const String GET_FAVORITES_URL = "song/favorite/show/";
const String DELETE_FAVORITE_URL = "favorite/delete/";
const String DELETE_PLAYLIST_URL = "playlist/delete/";
const String GET_ARTIST_URL = "artist/showall";
const String FOLLOW_ARTIST_URL = "artist/follow";
const String GET_FOLLOWING_ARTIST_URL = "user/artist/follow/showall/";
const String GET_FOLLOWED_ARTIST_FROM_ID = "user/artist/showfromid/";
const String UNFOLLOW_ARTIST= "artist/unfollow/";
const String DELETE_USER = "user/delete/";
const String SEARCH_SONGS = "song/search/";


String get getRegisterUrl => BASE_URL + REGISTER_URL;
String get getLoginUrl => BASE_URL + LOGIN_URL;
String get getUploadSong => BASE_URL + UPLOAD_SONG_URL;
String get getUserProfile => BASE_URL + USER_PROFILE_URL;
String get getUpdateProfile => BASE_URL + UPDATE_PROFILE_URL;
String get getUpdateProfilewithoutImage => BASE_URL + UPDATE_PROFILE_URL_WITHOUT_IMAGE;
String get getCreatePlaylist => BASE_URL + CREATE_PLAYLIST_URL;
String get getPlaylistShowall => BASE_URL + GET_PLAYLIST_URL;
String get getSongsServer => BASE_URL + GET_SONG_URL;
String get getSelectedSongServer => BASE_URL + GET_SELECTED_SONG_URL;
String get addtoFavorites => BASE_URL + ADD_TO_FAVORITES_URL;
String get getFavorites => BASE_URL + GET_FAVORITES_URL;
String get deleteFavorites => BASE_URL + DELETE_FAVORITE_URL;
String get deletePlaylist => BASE_URL+DELETE_PLAYLIST_URL;
String get getArtistShowall => BASE_URL+GET_ARTIST_URL;
String get followArtist => BASE_URL+FOLLOW_ARTIST_URL;
String get getallfollowArtist => BASE_URL+GET_FOLLOWING_ARTIST_URL;
String get getfollowArtistfromid => BASE_URL+GET_FOLLOWED_ARTIST_FROM_ID;
String get unfollowArtist => BASE_URL+UNFOLLOW_ARTIST;
String get deleteaccount => BASE_URL+DELETE_USER;
String get searchsongfromApi => BASE_URL+SEARCH_SONGS;

