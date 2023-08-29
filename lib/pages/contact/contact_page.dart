import 'package:flutter/material.dart';
import 'package:web_profile/controller/responsive.dart';
import '../../components/widget/header_page.dart';
import 'widget/contact_info.dart';
import 'widget/form_send_email.dart';

class PageContact extends StatefulWidget {
  const PageContact({super.key});

  @override
  State<PageContact> createState() => _PageContactState();
}

class _PageContactState extends State<PageContact> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      child: Column(
        children: [
          const HeaderTitle(title: 'GET IN TOUCH'),
          const SizedBox(height: 30),
          Responsive.isDesktop(context)
              ? const Row(
                  children: [
                    Expanded(child: FormSendEmail()),
                    SizedBox(width: 50),
                    Expanded(child: ContactInfo()),
                  ],
                )
              : const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ContactInfo(),
                    SizedBox(height: 30),
                    FormSendEmail(),
                  ],
                ),
        ],
      ),
    );
  }
}
