import 'package:auto_route/annotations.dart';
import 'package:event_planner/features/home/blocs/home_bloc.dart';
import 'package:event_planner/features/home/widgets/post_item.dart';
import 'package:event_planner/shared_components/widgets/page_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../shared_components/theme/color_pallet.dart';
import '../../shared_components/theme/text_styles.dart';
import '../../shared_components/util/constants.dart';

@RoutePage()
class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetComments());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc,HomeState>(
      builder: (context,homeState) {
        return PageBase(
            showAppBar: false,
            bodyObservesSafeArea: false,
            resizeToAvoidBottomInset: false,
            showProgress: homeState.isPostsLoading,
            body: Column(
              children: [
                Gap(40),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: ColorPallet.white
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7.0,vertical: 3),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.arrow_back_ios_new_rounded,color: ColorPallet.black,size: 20,),
                                Text("Back",style: ThemeTextStyles.text17.copyWith(
                                    color: ColorPallet.black
                                ),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Center(child: Text(Constants.posts, style: ThemeTextStyles.grey19)),
                Gap(20),
                Expanded(
                  child: ListView.builder(
                      itemCount: homeState.posts.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      itemBuilder: (context, index) {
                        return  PostItem(post: homeState.posts[index]);
                      }
                  ),
                ),
                Gap(50),
              ],
            )
        );
      }
    );
  }
}
