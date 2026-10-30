import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchPhoneCall(BuildContext context, String phoneNumber) async {
  final normalizedNumber = phoneNumber.replaceAll(RegExp(r'[^0-9+]'), '');
  final phoneUri = Uri(scheme: 'tel', path: normalizedNumber);
  final messenger = ScaffoldMessenger.of(context);

  try {
    final launched = await launchUrl(
      phoneUri,
      mode: LaunchMode.externalApplication,
    );

    if (!launched) {
      _showPhoneLaunchError(messenger);
    }
  } on PlatformException {
    _showPhoneLaunchError(messenger);
  } on MissingPluginException {
    _showPhoneLaunchError(messenger);
  }
}

void _showPhoneLaunchError(ScaffoldMessengerState messenger) {
  if (messenger.mounted) {
    messenger.showSnackBar(
      SnackBar(content: Text('ไม่สามารถเปิดแอปโทรศัพท์ได้')),
    );
  }
}
