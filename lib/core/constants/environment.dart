import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String messagingSenderId = dotenv.get('MESSAGING_SENDER_ID');
  static String projectId = dotenv.get('PROJECT_ID');
  static String storageBucket = dotenv.get('STORAGE_BUCKET');

  static String androidApiKey = dotenv.get('ANDROID_API_KEY');
  static String androidAppId = dotenv.get('ANDROID_APP_ID');

  static String mainTopic = dotenv.get('MAIN_TOPIC');
}
