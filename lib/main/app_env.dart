enum AppEnvironment { DEV, STAGING, PROD }

abstract class EnvInfo {
  static AppEnvironment _environment = AppEnvironment.DEV;

  static void initialize(AppEnvironment environment) {
    EnvInfo._environment = environment;
  }

  static String get appName => _environment._appTitle;

  static String get envName => _environment._envName;

  static String get connectionString => _environment._connectionString;

  static AppEnvironment get environment => _environment;

  static bool get isProduction => _environment == AppEnvironment.PROD;
}

extension _EnvProperties on AppEnvironment {
  static const _appTitles = {
    AppEnvironment.DEV: 'Galaxy18 Lottery Dev',
    AppEnvironment.STAGING: 'Galaxy18 Lottery Staging',
    AppEnvironment.PROD: 'Galaxy18 Lottery',
  };

  static const _connectionStrings = {
    AppEnvironment.DEV: 'https://galaxy-lottery-backend-dev.up.railway.app/api/auth/customers',
    AppEnvironment.STAGING: 'https://api.spoonacular.com',
    AppEnvironment.PROD: 'https://api.spoonacular.com',
  };

  static const _envs = {
    AppEnvironment.DEV: 'dev',
    AppEnvironment.STAGING: 'staging',
    AppEnvironment.PROD: 'prod',
  };

  String get _appTitle => _appTitles[this]!;
  String get _envName => _envs[this]!;
  String get _connectionString => _connectionStrings[this]!;
}
