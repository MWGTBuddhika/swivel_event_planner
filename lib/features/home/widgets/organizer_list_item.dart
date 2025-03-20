import 'package:event_planner/shared_components/models/organizer.dart';
import 'package:event_planner/shared_components/theme/text_styles.dart';
import 'package:event_planner/shared_components/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../shared_components/theme/color_pallet.dart';

class OrganizerListItem extends StatelessWidget {
  const OrganizerListItem({super.key,required this.organizer});
  final Organizer organizer;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.2), // Change color as needed
            width: 2.0, // Border thickness
          ),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              child: Image.network(
                Constants().getRandomImageUrl(),
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
            ),
          ),
          Gap(15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(organizer.name??"",style: ThemeTextStyles.subtitlesS2,),
              Text(organizer.email??"",style: ThemeTextStyles.subTextStyle,),
            ],
          ),
          Spacer(),
          Icon(Icons.message)
        ],
      ),
    );
  }
}
