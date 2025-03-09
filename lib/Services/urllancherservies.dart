import 'package:url_launcher/url_launcher.dart';

Future<void> openWhatsAppWeb(String phoneNumber, String message) async {
  final whatsappWebUrl = 'https://wa.me/+966$phoneNumber?text=${Uri.encodeComponent(message)}';

  if (await canLaunch(whatsappWebUrl)) {
    await launch(whatsappWebUrl);
  } else {
    throw 'Could not open WhatsApp Web';
  }
}
