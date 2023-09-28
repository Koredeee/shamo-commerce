// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shamo/pages/widgets/checkout_card.dart';
import 'package:shamo/theme.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  PreferredSizeWidget header() {
    return AppBar(
      backgroundColor: backgroundColor1,
      elevation: 0,
      centerTitle: true,
      title: Text('Checkout Details'),
    );
  }

  Widget content() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
      children: [
        // NOTE: LIST ITEMS
        Container(
          margin: EdgeInsets.only(top: defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'List Items',
                style:
                    primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              CheckoutCard(),
              CheckoutCard(),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: content(),
    );
  }
}
