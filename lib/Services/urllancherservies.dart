import 'package:url_launcher/url_launcher.dart';

Future<void> openWhatsAppWeb(String phoneNumber, String message) async {
  final Uri whatsappBusinessUrl = Uri.parse(
      'https://wa.me/+966$phoneNumber?text=${Uri.encodeComponent(message)}');

  if (await canLaunchUrl(whatsappBusinessUrl)) {
    await launchUrl(whatsappBusinessUrl, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not open WhatsApp Business';
  }
}
