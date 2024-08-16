import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travelme/theme.dart';
import 'package:travelme/widgets/custom_buttons.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({super.key});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime selectedDate = DateTime.now();
  DateTime dateNull = DateTime(DateTime.now().year - 1, DateTime.now().month);
  DateTime startDate = DateTime.now();
  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(defaultMargin),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'Choose Booking Date',
            style: primaryTextStyle.copyWith(
              fontWeight: semibold,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          _buildYearSelector(),
          _buildMonthSelector(),
          Divider(
            color: primaryTextColor,
          ),
          _buildWeekdayRow(),
          Expanded(child: _buildDateSelector()),
          Align(
            alignment: Alignment.bottomCenter,
            child: _bottomBar(),
          )
        ],
      ),
    );
  }

  Widget _buildYearSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: selectedDate.year <= DateTime.now().year
              ? null
              : () {
                  if (selectedDate.year > DateTime.now().year) {
                    setState(() {
                      selectedDate = DateTime(
                        selectedDate.year - 1,
                        selectedDate.month,
                      );
                    });
                  }
                },
          icon: Icon(
            Icons.arrow_back,
            color: primaryTextColor,
            size: 20,
          ),
        ),
        Text(
          DateFormat.y().format(selectedDate),
          style: primaryTextStyle.copyWith(
            fontWeight: semibold,
            fontSize: 14,
          ),
        ),
        IconButton(
            onPressed: () {
              setState(() {
                selectedDate = DateTime(
                  selectedDate.year + 1,
                  selectedDate.month,
                );
              });
            },
            icon: Icon(
              Icons.arrow_forward,
              color: primaryTextColor,
              size: 20,
            ))
      ],
    );
  }

  _buildMonthSelector() {
    return SizedBox(
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 12,
          itemBuilder: (context, index) {
            String month = DateFormat.MMMM().format(DateTime(0, index + 1));
            bool isSelected = selectedDate.month == index + 1;
            return GestureDetector(
              onTap: index + 1 < DateTime.now().month
                  ? null
                  : () {
                      setState(() {
                        selectedDate = DateTime(selectedDate.year, index + 1);
                      });
                    },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: isSelected ? primaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: Alignment.center,
                child: Text(
                  month,
                  style: primaryTextStyle.copyWith(
                    fontWeight: isSelected ? semibold : medium,
                    fontSize: 12,
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget _buildWeekdayRow() {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
            .map(
              (day) => Expanded(
                child: Center(
                  child: Text(
                    day,
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildDateSelector() {
    List<Widget> days = [];
    DateTime firstDayOfMonth =
        DateTime(selectedDate.year, selectedDate.month, 1);
    int daysInMonth =
        DateTime(selectedDate.year, selectedDate.month + 1, 0).day;

    for (int i = 0; i < firstDayOfMonth.weekday - 1; i++) {
      days.add(Container());
    }

    for (int i = 1; i <= daysInMonth; i++) {
      DateTime day = DateTime(selectedDate.year, selectedDate.month, i);
      bool isSelected = endDate != null
          ? day.isAfter(startDate) && day.isBefore(endDate!)
          : day == startDate || day == endDate;

      days.add(GestureDetector(
        onTap: () {
          setState(() {
            if (endDate == null && day.isAfter(startDate)) {
              endDate = day;
            } else {
              startDate = day;
              endDate = null;
            }
          });
        },
        child: Container(
          margin: const EdgeInsets.all(4),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: isSelected ? primaryColor : Colors.transparent,
              shape: BoxShape.circle),
          child: Text(
            i.toString(),
            style: primaryTextStyle.copyWith(
              fontWeight: isSelected ? semibold : medium,
              fontSize: 12,
            ),
          ),
        ),
      ));
    }

    return GridView.count(
      crossAxisCount: 7,
      shrinkWrap: true,
      children: days,
    );
  }

  Widget _bottomBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PrimaryOutlinedButton(
            buttonText: 'Back',
            onPressed: () {
              Navigator.pop(context);
            }),
        PrimaryFilledButton(
          buttonText: 'Confirm',
          onPressed: endDate != null
              ? () {
                  Navigator.pop(context);
                }
              : null,
        )
      ],
    );
  }
}
