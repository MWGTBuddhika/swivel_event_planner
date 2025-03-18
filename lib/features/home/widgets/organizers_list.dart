import 'package:event_planner/features/home/widgets/organizer_list_item.dart';
import 'package:event_planner/shared_components/theme/color_pallet.dart';
import 'package:flutter/material.dart';

class OrganizersList extends StatelessWidget {
  const OrganizersList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context, index) {
          return  OrganizerListItem();
        }
    );
  }
}
