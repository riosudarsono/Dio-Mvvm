import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dio_mvvm/ui/detail/detail_page.dart';
import 'package:dio_mvvm/app/widgets/custombox.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key, required this.productsList}) : super(key: key);
  final List<String> productsList;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: productsList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 0.0,
            childAspectRatio: 0.6),
        itemBuilder: (ctx, index) {
          return GestureDetector(
              onTap: () {
                context.pushNamed(DetailPage.route);
              },
              child: ProductList(product: productsList[index]));
          // return ChangeNotifierProvider.value(
          //   value: productsList[index],
          //   child: const FeedsWidget(),
          // );
        });
  }
}

class ProductList extends StatelessWidget {
  ProductList({Key? key, required this.product}) : super(key: key);
  final String product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            CustomBox(
                color: Color.fromARGB(255, 211, 211, 211),
                offset: Offset.zero,
                blurRadius: 6.0,
                blurStyle: BlurStyle.outer),
          ],
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
                'https://s3.ap-southeast-1.amazonaws.com/crealoka/product/24/ORIGINAL/kyYsywBadnaWPDoUyXfg.jpg'),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Exterior',
                style: TextStyle(fontSize: 12, color: Colors.blue),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'AGYA/AYLA HANDLE COVER XTIVO BLACKTIVO',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Rp 330.000',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    'JSL',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
