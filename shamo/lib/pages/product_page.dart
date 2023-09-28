// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  static const List images = [
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
  ];

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int currentIndex = 0;
  bool isWishList = false;

  List familiarShoes = [
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
  ];

  Future<void> showSuccessDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) => Container(
        width: MediaQuery.of(context).size.width - (2 * defaultMargin),
        child: AlertDialog(
          backgroundColor: backgroundColor3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.close, color: primaryTextColor))),
                Image.asset('assets/icon_success.png', width: 100),
                SizedBox(height: 12),
                Text(
                  'Horrayy!',
                  style: primaryTextStyle.copyWith(
                      fontSize: 18, fontWeight: semiBold),
                ),
                SizedBox(height: 12),
                Text('Item added successfully!', style: secondaryTextStyle),
                SizedBox(height: 20),
                Container(
                  width: 154,
                  height: 44,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text(
                      'View My Cart',
                      style: primaryTextStyle.copyWith(
                          fontSize: 16, fontWeight: medium),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget indicator(int index) {
    return Container(
      width: currentIndex == index ? 16 : 4,
      height: 4,
      margin: EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // apabila curr berada di index, maka warna primary color, kalo tidak
        // warna #C4C4C4
        color: currentIndex == index ? primaryColor : Color(0xffC4C4C4),
      ),
    );
  }

  Widget familiarShoesCard(String imageUrl) {
    return Container(
      width: 54,
      height: 54,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageUrl),
        ),
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }

  Widget header(BuildContext context) {
    int index = -1;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 20,
            left: defaultMargin,
            right: defaultMargin,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.chevron_left),
              ),
              Icon(Icons.shopping_bag, color: backgroundColor1),
            ],
          ),
        ),
        CarouselSlider(
          items: ProductPage.images
              .map(
                (image) => Image.asset(
                  image,
                  width: MediaQuery.of(context).size.width,
                  height: 310,
                  fit: BoxFit.cover,
                ),
              )
              .toList(),
          options: CarouselOptions(
            initialPage: 0,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: ProductPage.images.map((e) {
            index++;
            return indicator(index);
          }).toList(),
        ),
      ],
    );
  }

  Widget content() {
    int index = -1;

    return Container(
      margin: EdgeInsets.only(top: 17),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        color: backgroundColor1,
      ),
      child: Column(
        children: [
          // NOTE: HEADER
          Container(
            margin: EdgeInsets.only(
              top: defaultMargin,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'TERREX URBAN LOW',
                        style: primaryTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                      Text(
                        'Hiking',
                        style: secondaryTextStyle.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      // apabila diklik maka isWishList = true
                      // lalu diklik maka isWishList = false
                      isWishList = !isWishList;
                    });

                    if (isWishList) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: secondaryColor,
                          content: Text(
                            'Has been added to the Wishlist',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: alertColor,
                          content: Text(
                            'Has been removed from the Wishlist',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }
                  },
                  child: Image.asset(
                      isWishList
                          ? 'assets/button_wishlist_blue.png'
                          : 'assets/button_wishlist.png',
                      width: 46),
                ),
              ],
            ),
          ),

          // NOTE: PRICE
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
              top: 20,
              left: defaultMargin,
              right: defaultMargin,
            ),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: backgroundColor2,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Price Starts from', style: primaryTextStyle),
                Text(
                  '\$143,98',
                  style: priceTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
              ],
            ),
          ),

          // NOTE : DESCRIPTION
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
              top: defaultMargin,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description',
                  style: primaryTextStyle.copyWith(fontWeight: medium),
                ),
                SizedBox(height: 12),
                Text(
                  'Unpaved trails and mixed surfaces are easy when you have the traction and support you need. Casual enough for the daily commute.',
                  style: subtitleTextStyle.copyWith(fontWeight: light),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),

          // NOTE: FAMILIAR SHOES
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
              top: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Text(
                    'Familiar Shoes',
                    style: primaryTextStyle.copyWith(fontWeight: medium),
                  ),
                ),
                SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: familiarShoes.map((image) {
                    index++;
                    return Container(
                      margin:
                          EdgeInsets.only(left: index == 0 ? defaultMargin : 0),
                      child: familiarShoesCard(image),
                    );
                  }).toList()),
                ),
              ],
            ),
          ),

          // NOTE: BUTTONS
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
                bottom: defaultMargin),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/detail-chat');
                  },
                  child: Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/button_chat.png'),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: 54,
                    child: TextButton(
                      onPressed: () {
                        showSuccessDialog();
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: primaryColor,
                      ),
                      child: Text(
                        'Add To Cart',
                        style: primaryTextStyle.copyWith(
                            fontSize: 16, fontWeight: semiBold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor6,
        body: ListView(
          children: [
            header(context),
            content(),
          ],
        ));
  }
}
