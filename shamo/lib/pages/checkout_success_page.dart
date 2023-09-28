import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class CheckoutSuccessPage extends StatelessWidget {
  const CheckoutSuccessPage({super.key});

  PreferredSizeWidget header() {
    return AppBar(
      backgroundColor: backgroundColor1,
      centerTitle: true,
      title: Text('Checkout Success'),
      elevation: 0,
    );
  }

  Widget content(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/icon_empty_cart.png', width: 80),
          SizedBox(height: 20),
          Text(
            'You made a transaction',
            style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          SizedBox(height: 20),
          Text(
            'Stay at home while we prepare your dream shoes',
            style: secondaryTextStyle,
            textAlign: TextAlign.center,
          ),
          Container(
            width: 196,
            height: 44,
            margin: EdgeInsets.only(top: defaultMargin),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home', (route) => false);
              },
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Order Other Shoes',
                style:
                    primaryTextStyle.copyWith(fontWeight: medium, fontSize: 16),
              ),
            ),
          ),
          Container(
            width: 196,
            height: 44,
            margin: EdgeInsets.only(top: 12),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Color(0xff39374B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'View My Order',
                style: primaryTextStyle.copyWith(
                    fontWeight: medium, fontSize: 16, color: Color(0xffB7B6BF)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: content(context),
    );
  }
}
