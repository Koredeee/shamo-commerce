// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shamo/pages/widgets/chat_tile.dart';
import 'package:shamo/theme.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          'Message Support',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        elevation: 0, // erase the shadow
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyChat() {
      // pake Expanded karena sisa dari space akan di-isi dengan  content section
      return Expanded(
        child: Container(
          width: double.infinity,
          color: backgroundColor3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icon_headset.png', width: 80),
              SizedBox(
                height: 20,
              ),
              Text(
                'Oops no message yet?',
                style:
                    primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              SizedBox(height: 12),
              Text(
                'You have never done a transaction',
                // tidak perlu .copyWith karena sudah basenya 14 size from flutter
                style: secondaryTextStyle,
              ),
              SizedBox(height: 20),
              Container(
                height: 44,
                child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 10,
                      ),
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Explore Store',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    )),
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      // pake Expanded karena sisa dari space akan di-isi dengan  content section
      return Expanded(
        child: Container(
            width: double.infinity,
            color: backgroundColor3,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              children: [
                ChatTile(),
              ],
            )),
      );
    }

    return Column(
      children: [
        header(),
        content(),
        // emptyChat(),
      ],
    );
  }
}
