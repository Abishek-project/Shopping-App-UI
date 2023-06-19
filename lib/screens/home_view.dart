import 'package:flutter/material.dart';
import 'package:shopping_app/components/appbar.dart';
import 'package:shopping_app/screens/details_view.dart';

import '../constants/app.colors.dart';
import '../model/products.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbar(),
      body: body(context),
    );
  }

  body(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text(
            "Women",
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 20),
        const CategoryList(),
        const SizedBox(
          height: 10,
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: GridView.builder(
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: kDefaultPaddin,
              crossAxisSpacing: kDefaultPaddin,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              return imageCard(index, context);
            },
          ),
        ))
      ],
    );
  }

  imageCard(index, context) {
    return ItemCard(
      product: products[index],
      ontap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailView(product: products[index]),
            ));
      },
    );
  }
}

class ItemCard extends StatelessWidget {
  final Product product;
  final VoidCallback ontap;
  const ItemCard({
    Key? key,
    required this.product,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(kDefaultPaddin),
              decoration: BoxDecoration(
                color: product.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${product.id}",
                child: Image.asset(product.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              // products is out demo list
              product.title,
              style: const TextStyle(color: kTextLightColor),
            ),
          ),
          Text(
            "\$${product.price}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List<String> categories = ["Hand bag", "Jewellery", "Footwear", "Dresses"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {});
              selectedIndex = index;
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    categories[index],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:
                          selectedIndex == index ? kTextColor : kTextLightColor,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: kDefaultPaddin / 4), //top padding 5
                    height: 2,
                    width: 30,
                    color: selectedIndex == index
                        ? Colors.black
                        : Colors.transparent,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

appbar() {
  return const PreferredSize(
    preferredSize: Size.fromHeight(50.0),
    child: AppbarMenu(),
  );
}
