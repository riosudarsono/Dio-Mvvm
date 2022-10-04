import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dio_mvvm/ui/detail/detail_page.dart';
import 'package:card_swiper/card_swiper.dart';
import 'product_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Crealoka'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.25,
                    child: Swiper(
                      itemCount: 3,
                      itemBuilder: (ctx, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                image: const DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        'https://s3.ap-southeast-1.amazonaws.com/crealoka/banner/13/ORIGINAL/zNsPFQELmbKkxefxBTOV.png'))),
                          ),
                        );
                      },
                      autoplay: true,
                      pagination: const SwiperPagination(
                          alignment: Alignment.bottomCenter,
                          builder: DotSwiperPaginationBuilder(
                              color: Colors.grey, activeColor: Colors.blue)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Assesoris Mobil',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              context.pushNamed(DetailPage.route);
                            },
                            child: const Text('Lihat Semua'))
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: ProductView(productsList: ['1','2','3','1','2','3']),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      // body: Center(
      //     child: Column(
      //   children: [
      //     ElevatedButton(onPressed: () {}, child: const Text('Profile')),
      //     ElevatedButton(
      //         onPressed: () {
      //           context.pushNamed(DetailPage.route);
      //         },
      //         child: const Text('Detail')),
      //   ],
      // )),
    );
  }
}
