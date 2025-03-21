import 'package:carousel_slider/carousel_slider.dart';
import 'package:event_planner/features/home/blocs/home_bloc.dart';
import 'package:event_planner/shared_components/theme/color_pallet.dart';
import 'package:event_planner/shared_components/theme/text_styles.dart';
import 'package:event_planner/shared_components/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>
      (builder: (context, homeState) {
      final double height = MediaQuery.of(context).size.height*0.3;
      return Container(
        height: height,
        child: Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  height: height,
                  viewportFraction: 0.85,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  enlargeFactor: 0.15,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index+1;
                    });
                  }),
              carouselController: _controller,
              items: homeState.sliderImages
                  .map((item) => ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Image.network(
                      item.url??Constants().getRandomImageUrl(),
                                    fit: BoxFit.cover,
                      loadingBuilder:
                          (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes !=
                                    null
                                ? loadingProgress
                                        .cumulativeBytesLoaded /
                                    (loadingProgress
                                            .expectedTotalBytes ??
                                        1)
                                : null,
                            color: ColorPallet.primaryColor,
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.error),
                    ),
                  ))
                  .toList(),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: EdgeInsets.only(bottom: 20,right: 50),
                width: 60,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: ColorPallet.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(_current.toString(),style: ThemeTextStyles.subTextStyle),
                    Text("/",style: ThemeTextStyles.subTextStyle),
                    Text("${homeState.sliderImages.length}",style: ThemeTextStyles.subTextStyle),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
