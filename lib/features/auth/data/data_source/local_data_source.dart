import 'package:recipesapp/config/cache/cache_constants.dart';
import 'package:recipesapp/config/cache/cache_helper.dart';
import 'package:recipesapp/features/auth/data/models/login_response_model.dart';

class AuthLocalDataSource {
  String? _cachedAccessToken;
  String? _cachedRefreshToken;

  //load tokens from secure storage into memory (call once at app startUp)
  Future<void> init() async {
    _cachedAccessToken = await CacheHelper.getSecureData(
      CacheConstants.accessToken,
    );
    _cachedRefreshToken = await CacheHelper.getSecureData(
      CacheConstants.refreshToken,
    );
  }

  //getters
  String? get accessToken => _cachedAccessToken;
  String? get refreshToken => _cachedRefreshToken;

  //SharedPreferences
  Future<void> saveUserData(LoginResponseModel user) async {
    await Future.wait([
      CacheHelper.saveData(key: CacheConstants.userId, value: user.id),
      CacheHelper.saveData(
        key: CacheConstants.firstName,
        value: user.firstName,
      ),
      CacheHelper.saveData(key: CacheConstants.username, value: user.username),
      CacheHelper.saveData(key: CacheConstants.lastName, value: user.lastName),
      CacheHelper.saveData(key: CacheConstants.email, value: user.email),
      CacheHelper.saveData(key: CacheConstants.gender, value: user.gender),
      CacheHelper.saveData(key: CacheConstants.image, value: user.image),
    ]);
  }

  LoginResponseModel? getUserData() {
    final id = CacheHelper.getData(key: CacheConstants.userId);
    if (id == null) return null;

    return LoginResponseModel(
      id: id,
      firstName: CacheHelper.getData(key: CacheConstants.firstName),
      lastName: CacheHelper.getData(key: CacheConstants.lastName),
      email: CacheHelper.getData(key: CacheConstants.email),
      gender: CacheHelper.getData(key: CacheConstants.gender),
      image: CacheHelper.getData(key: CacheConstants.image),
      username: CacheHelper.getData(key: CacheConstants.username),
      accessToken: '',
      refreshToken: '',
    );
  }

  Future<void> clearUserData() async {
    await Future.wait([
      CacheHelper.removeData(key: CacheConstants.userId),
      CacheHelper.removeData(key: CacheConstants.firstName),
      CacheHelper.removeData(key: CacheConstants.lastName),
      CacheHelper.removeData(key: CacheConstants.username),
      CacheHelper.removeData(key: CacheConstants.email),
      CacheHelper.removeData(key: CacheConstants.gender),
      CacheHelper.removeData(key: CacheConstants.image),
    ]);
  }

  //Secure Storage

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    _cachedAccessToken = accessToken;
    _cachedRefreshToken = refreshToken;

    await Future.wait([
      CacheHelper.saveSecureData(
        key: CacheConstants.accessToken,
        value: accessToken,
      ),
      CacheHelper.saveSecureData(
        key: CacheConstants.refreshToken,
        value: refreshToken,
      ),
    ]);
  }

  Future<String?> getAccessToken() async {
    return await CacheHelper.getSecureData(CacheConstants.accessToken);
  }

  Future<String?> getRefreshToken() async {
    return await CacheHelper.getSecureData(CacheConstants.refreshToken);
  }

  Future<void> clearTokens() async {
    _cachedAccessToken = null;
    _cachedRefreshToken = null;
    await Future.wait([
      CacheHelper.removeSecureData(key: CacheConstants.accessToken),
      CacheHelper.removeSecureData(key: CacheConstants.refreshToken),
    ]);
  }
}
