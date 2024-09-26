import 'package:url_launcher/url_launcher.dart';

abstract class UrlOpenFile {
  static Future<void> openFile(String url) async {
    // Open file in external application (browser or appropriate viewer)
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}
