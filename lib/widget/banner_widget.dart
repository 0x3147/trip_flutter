import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:trip_flutter/util/navigator_util.dart';
import 'package:trip_flutter/util/screen_adapter_helper.dart';

class BannerWidget extends StatefulWidget {
  final List<String> bannerList;

  const BannerWidget({super.key, required this.bannerList});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CarouselSlider(
          items:
              widget.bannerList.map((item) => _tabImage(item, width)).toList(),
          carouselController: _controller,
          options: CarouselOptions(
              height: 160.px,
              autoPlay: true,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        )
      ],
    );
  }

  Widget _tabImage(String imageUrl, width) {
    return GestureDetector(
      onTap: () {
        // NavigatorUtil
      },
      child: Image.network(imageUrl, width: width, fit: BoxFit.cover),
    );
  }
}
