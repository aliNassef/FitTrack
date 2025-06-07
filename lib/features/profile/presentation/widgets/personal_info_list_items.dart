import '../../data/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'personal_info_item.dart';

class PersonalInfoListItems extends StatelessWidget {
  const PersonalInfoListItems({
    super.key,
    required this.user,
  });
  final UserProfile user;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15.w,
      children: [
        Expanded(
          child: PersonalInfoItem(
            subTitle: 'Weight',
            title: '${user.weight}kg',
          ),
        ),
        Expanded(
          child: PersonalInfoItem(
            subTitle: 'Age',
            title:
                '${DateTime.now().difference(DateTime.parse(user.dataOfbirth)).inDays ~/ 365}',
          ),
        ),
        Expanded(
          child: PersonalInfoItem(
            subTitle: 'Height',
            title: '${user.height}cm',
          ),
        ),
      ],
    );
  }
}
