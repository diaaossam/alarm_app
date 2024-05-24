import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get fileName => kReleaseMode ? ".env.production" : ".env.development";
  static String get apiUrl => dotenv.env['API_BASE_URL'] ?? 'MY_FALLBACK';
  static String get mapUrl => dotenv.env['GOOGLE_MAP_API_URL'] ?? 'MY_FALLBACK';
  static String get notificationServerKey => dotenv.env['NOTIFICATION_SERVER_KEY'] ?? 'MY_FALLBACK';
  static String get googleMapApiKey => dotenv.env['GOOGLE_MAP_API_KEY'] ?? 'MY_FALLBACK';
  static String get socketBaseUrl => dotenv.env['SOCKET_BASE_URL'] ?? 'MY_FALLBACK';
  static String get revenuecatAppleApiKey => dotenv.env['PURCHASES_APPLE_API_KEY'] ?? 'MY_FALLBACK';
  static String get revenuecatGoogleApiKey => dotenv.env['PURCHASES_GOOGLE_API_KEY'] ?? 'MY_FALLBACK';


}