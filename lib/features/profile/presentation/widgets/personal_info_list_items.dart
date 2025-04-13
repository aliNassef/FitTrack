import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'personal_info_item.dart';

class PersonalInfoListItems extends StatelessWidget {
  const PersonalInfoListItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15.w,
      children: [
        const Expanded(
          child: PersonalInfoItem(
            subTitle: 'Weight',
            title: '70kg',
          ),
        ),
        const Expanded(
          child: PersonalInfoItem(
            subTitle: 'Age',
            title: '25',
          ),
        ),
        const Expanded(
          child: PersonalInfoItem(
            subTitle: 'Height',
            title: '180cm',
          ),
        ),
      ],
    );
  }
}
