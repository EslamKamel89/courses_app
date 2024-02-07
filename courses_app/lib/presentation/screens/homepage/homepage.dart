import 'package:courses_app/core/extension/extensions.dart';
import 'package:courses_app/core/textstyle/text_style.dart';
import 'package:courses_app/presentation/components/appbar.dart';
import 'package:courses_app/presentation/screens/homepage/widgets/homepage_search_field.dart';
import 'package:courses_app/presentation/screens/homepage/widgets/horizantal_scroll_view.dart';
import 'package:courses_app/presentation/screens/homepage/widgets/menu_items.dart';
import 'package:courses_app/presentation/screens/homepage/widgets/search_filter.dart';
import 'package:courses_app/presentation/screens/homepage/widgets/see_all_button.dart';
import 'package:courses_app/presentation/screens/homepage/widgets/selection_options_button.dart';
import 'package:courses_app/presentation/screens/homepage/widgets/welcome_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    // GlobalServices.localStorage.inst.clear();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar.homepage(context),
      body: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 10.w, top: 15.h, bottom: 15.h),
        child: CustomScrollView(
          slivers: [
            const WelcomeText().sliver,
            SizedBox(height: 5.h).sliver,
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: HomepageSearchField()),
                HomePageSearchFilter(),
              ],
            ).sliver,
            const HorizontalScrollView().sliver,
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(width: 5.w),
                Txt.title('Choose Your Courses', size: 15.sp, fontWeight: FontWeight.bold),
                const Spacer(),
                const SeeAllButton(),
                SizedBox(width: 5.w),
              ],
            ).sliver,
            const SelectionOptionButtons().sliver,
            const MenuItems()
          ],
        ),
      ),
    );
  }
}
