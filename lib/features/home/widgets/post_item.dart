import 'package:event_planner/features/home/blocs/home_bloc.dart';
import 'package:event_planner/shared_components/models/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../shared_components/theme/color_pallet.dart';
import '../../../shared_components/theme/text_styles.dart';
import '../../../shared_components/util/constants.dart';

class PostItem extends StatefulWidget {
  const PostItem({super.key,required this.post});
  final Post post;

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  bool isExpanded=false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorPallet.fadedOrange
      ),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.post.title??"",style: ThemeTextStyles.subtitlesS2),
                    Text(widget.post.body??"",style: ThemeTextStyles.subTextStyle,),
                  ],
                ),
              ),
            ],
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon: Icon(
                    isExpanded?Icons.keyboard_arrow_up_rounded:
                    Icons.keyboard_arrow_down_rounded),
              onPressed: (){
                  setState(()=>isExpanded= !isExpanded);
              }
              )
          ),
          isExpanded?
          Align(
            alignment: Alignment.centerLeft,
              child: Text(Constants.comments, style: ThemeTextStyles.bodyTextB1)):
              SizedBox.shrink(),
          isExpanded?
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: BlocBuilder<HomeBloc,HomeState>(
                  builder: (context,homeState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: homeState.comments
                            .where((comment) => comment.postId == widget.post.id) // Filter first
                            .map((comment) =>
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: ColorPallet.black.withValues(alpha: 0.4)))
                              ),
                              padding: EdgeInsets.symmetric(vertical: 5),
                                child: Text(comment.name ?? "")))
                            .toList()
                    );
                  }
                ),
              ):
              SizedBox.shrink()
        ],
      ),
    );
  }
}
