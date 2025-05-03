
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_gradients.dart';
import '../../../../core/utils/app_styles.dart';

class MealScheduale extends StatefulWidget {
  const MealScheduale({super.key});

  @override
  State<MealScheduale> createState() => _MealSchedualeState();
}

class _MealSchedualeState extends State<MealScheduale> {
  late DateTime _selectedDate;
  late DateTime _currentMonth;
  late List<DateTime> _daysInMonth;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _currentMonth = DateTime(_selectedDate.year, _selectedDate.month);
    _generateDaysInMonth();
  }

  void _generateDaysInMonth() {
    _daysInMonth = [];
    final daysInMonth =
        DateTime(_currentMonth.year, _currentMonth.month + 1, 0).day;

    for (int i = 1; i <= daysInMonth; i++) {
      _daysInMonth.add(DateTime(_currentMonth.year, _currentMonth.month, i));
    }
  }

  void _selectDate(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }

  void _previousMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1);
      _generateDaysInMonth();
    });
  }

  void _nextMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1);
      _generateDaysInMonth();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      children: [
        _buildCalendarHeader(),
        _buildCalendarDays(),
      ],
    );
  }

  Widget _buildCalendarHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: _previousMonth,
            color: const Color(0xffA5A3B0),
          ),
          Text(
            DateFormat('MMMM yyyy').format(_currentMonth),
            style: AppStyles.regular14.copyWith(
              color: const Color(0xffA5A3B0),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: _nextMonth,
            color: const Color(0xffA5A3B0),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarDays() {
    return SizedBox(
      height: 80.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _daysInMonth.length,
        itemBuilder: (context, index) {
          final date = _daysInMonth[index];
          final isSelected = date.day == _selectedDate.day &&
              date.month == _selectedDate.month &&
              date.year == _selectedDate.year;

          return GestureDetector(
            onTap: () => _selectDate(date),
            child: Container(
              width: 60.w,
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: isSelected
                      ? AppGradients.pinkGradient
                      : [
                          const Color(0xffF7F8F8),
                          const Color(0xffF7F8F8),
                        ],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('EEE').format(date).substring(0, 3),
                    style: AppStyles.medium14.copyWith(
                      color: isSelected ? Colors.white : Colors.grey,
                    ),
                  ),
                  const VerticalSpace(8),
                  Text(
                    date.day.toString(),
                    style: AppStyles.bold16.copyWith(
                      color: isSelected
                          ? Colors.white
                          : AppColors.greyLighterColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
