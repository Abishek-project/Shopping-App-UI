import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping_app/constants/app.assets.dart';

class AppbarMenu extends StatelessWidget {
  const AppbarMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(AppAssets.backIcon),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset(
            AppAssets.searchIcon,
            color: Colors.grey,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            AppAssets.cart,
            color: Colors.grey,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
