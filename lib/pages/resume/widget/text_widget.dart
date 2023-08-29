import 'package:flutter/material.dart';
import '../../../controller/navigation.dart';

buildRichText(String title, String content) => RichText(
      text: TextSpan(
        text: title,
        style: Navigation.textTheme.bodyText1!
            .copyWith(color: Colors.black87, fontWeight: FontWeight.bold),
        children: <TextSpan>[
          TextSpan(
              text: content,
              style: Navigation.textTheme.bodyText1!
                  .copyWith(color: Colors.black54)),
        ],
      ),
    );
