import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:steven_sales_app/common/app_style.dart';

final List<Widget> imageSliders = [
  const CarrouselItem(
    image: 'assets/icons/ic_calendar.png',
    title: 'Sisa Cuti',
    subtitle: "0",
  ),
  const CarrouselItem(
    image: 'assets/icons/ic_calendar.png',
    title: 'Sisa Cuti',
    subtitle: "0",
  ),
];

class CarrouselItem extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  const CarrouselItem({Key? key, required this.image, required this.title, required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppStyle.whiteColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppStyle.blackColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                height: 14,
              ),
              const SizedBox(
                width: 5.0,
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  color: AppStyle.blackColor,
                  fontWeight: FontWeight.w800,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class VerticalSlider extends StatefulWidget {
  const VerticalSlider({super.key});

  @override
  State<VerticalSlider> createState() => _VerticalSliderState();
}

class _VerticalSliderState extends State<VerticalSlider> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imageSliders.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                width: 2.0,
                height: 12.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: (Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.white)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
        CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 14 / 10,
            enlargeCenterPage: true,
            scrollDirection: Axis.vertical,
            autoPlay: false,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          items: imageSliders,
        ),
      ],
    );
  }
}
