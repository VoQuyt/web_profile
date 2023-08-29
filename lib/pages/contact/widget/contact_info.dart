import 'package:flutter/material.dart';

import '../../../controller/navigation.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoElement(
            Icons.location_on_outlined, 'ADDRESS', 'Ho Chi Minh - Viet Nam'),
        const SizedBox(height: 30),
        _buildInfoElement(
            Icons.phone_android_outlined, 'CALL US', '+84 385804***'),
        const SizedBox(height: 30),
        _buildInfoElement(
            Icons.mail_outline_outlined, 'ENQUIRIES', 'quyet.vox@gmail.com'),
      ],
    );
  }

  _buildInfoElement(IconData iconData, String title, String info) => Row(
        children: [
          Icon(iconData, color: Colors.black, size: 25),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Navigation.textTheme.bodyText1!.copyWith(
                      color: Colors.black87, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  info,
                  style: Navigation.textTheme.bodyText1!
                      .copyWith(color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      );
}
