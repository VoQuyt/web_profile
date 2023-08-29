import 'package:flutter/material.dart';
import 'package:web_profile/apis/sender_email.dart';
import 'package:web_profile/services/instance_data.dart';

import '../../../components/hover/hover_widget.dart';
import '../../../controller/navigation.dart';

class FormSendEmail extends StatefulWidget {
  const FormSendEmail({super.key});

  @override
  State<FormSendEmail> createState() => _FormSendEmailState();
}

class _FormSendEmailState extends State<FormSendEmail> {
  final _formKey = GlobalKey<FormState>();

  Future _trySubmit() async {
    bool _isValid = _formKey.currentState!.validate();
    if (_isValid) {
      InstanceData.message +=
          "<br> <b>name:</b> ${InstanceData.name} <br> <b>from</b>: ${InstanceData.email}";
      String body =
          "email=quyet.vox@gmail.com&sender_name=${InstanceData.name}&sender_email=quyet.vox@gmail.com&subject=${InstanceData.subject}&body=${InstanceData.message}&list_id=1";
      await Apis.senderEmail(body);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Thank you!'),
        backgroundColor: Colors.green,
      ));
      _clearText();
    }
  }

  _clearText() {
    InstanceData.clearData();
    _formKey.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            initialValue: InstanceData.email,
            onSaved: (value) {
              InstanceData.email = value as String;
            },
            onChanged: (value) {
              InstanceData.email = value as String;
            },
            validator: (value) {
              if (value == null || !value.contains('@') || value.isEmpty) {
                return 'Please enter your email address';
              }
              return null;
            },
            key: const ValueKey('email'),
            keyboardType: TextInputType.emailAddress,
            style: _lableStyle.copyWith(color: Colors.black87),
            decoration: _inputDecoration('Email*'),
          ),
          TextFormField(
              initialValue: InstanceData.name,
              onSaved: (value) {
                InstanceData.name = value as String;
              },
              onChanged: (value) {
                InstanceData.name = value as String;
              },
              validator: (value) {
                if (value == null || value.length < 3 || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              key: const ValueKey('username'),
              style: _lableStyle.copyWith(color: Colors.black87),
              decoration: _inputDecoration('Name*')),
          TextFormField(
              initialValue: InstanceData.subject,
              onSaved: (value) {
                InstanceData.subject = value as String;
              },
              onChanged: (value) {
                InstanceData.subject = value as String;
              },
              validator: (value) {
                if (value == null || value.length < 3 || value.isEmpty) {
                  return 'Please enter your subject';
                }
                return null;
              },
              key: const ValueKey('subject'),
              style: _lableStyle.copyWith(color: Colors.black87),
              decoration: _inputDecoration('Subject*')),
          TextFormField(
              initialValue: InstanceData.message,
              onSaved: (value) {
                InstanceData.message = value as String;
              },
              onChanged: (value) {
                InstanceData.message = value as String;
              },
              validator: (value) {
                if (value == null || value.length < 6) {
                  return 'Message must be at least 7 characters';
                }
                return null;
              },
              keyboardType: TextInputType.multiline,
              maxLines: 8,
              key: const ValueKey('usermessage'),
              style: _lableStyle.copyWith(color: Colors.black87),
              decoration: _inputDecoration('Your message')),
          const SizedBox(
            height: 20,
          ),
          _buildButtonSendEmail(),
        ],
      ),
    );
  }

  _buildButtonSendEmail() => HoverTranslate(
        child: GestureDetector(
          onTap: () => _trySubmit(),
          child: Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
              //color: const Color(0xff333333),
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('SEND MESSAGE',
                    style: Navigation.textTheme.headline6!
                        .copyWith(color: Colors.black)),
                const SizedBox(width: 5),
                const Icon(Icons.send_rounded, color: Colors.black, size: 25)
              ],
            ),
          ),
        ),
      );

  final TextStyle _lableStyle =
      Navigation.textTheme.bodyText2!.copyWith(color: Colors.black54);

  InputDecoration _inputDecoration(String labelText) => InputDecoration(
        hintText: labelText,
        hintStyle: _lableStyle,
        floatingLabelStyle: _lableStyle,
        errorStyle: _lableStyle.copyWith(color: Colors.redAccent),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black87, width: 0.5),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black87, width: 0.5),
        ),
      );
}
