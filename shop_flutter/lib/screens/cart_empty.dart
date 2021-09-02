import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_flutter/constants/colors.dart';
import 'package:shop_flutter/provider/dark_theme.dart';

class CartEmpty extends StatelessWidget {
  const CartEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          width: MediaQuery.of(context).size.width, // double.infinity
          height: MediaQuery.of(context).size.height * .4,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/emptycart.png'),
            ),
          ),
        ),
        Text(
          'Your Cart Is Empty',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: TextSelectionTheme.of(context).selectionColor,
              fontSize: 36,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          'Looks like You didn\'t \nadd anything to your cart yet',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: themeChange.isDarkTheme
                  ? Theme.of(context).disabledColor
                  : ColorsConsts.subTitle,
              fontSize: 22,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: MediaQuery.of(context).size.width * .9,
          height: MediaQuery.of(context).size.height * 0.06,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              'Shop Now'.toUpperCase(),
            ),
            style: ElevatedButton.styleFrom(
                primary: Colors.redAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(color: Colors.red)),
                textStyle: TextStyle(
                  fontSize: 24,
                )),
          ),
        ),
      ],
    );
  }
}
