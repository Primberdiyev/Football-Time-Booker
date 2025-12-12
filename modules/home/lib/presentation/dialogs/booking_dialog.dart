import 'package:common_base/common_base.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class BookingDialog extends StatefulWidget {
  const BookingDialog({
    super.key,
    required this.selectedHour,
    required this.datetime,
    required this.stadiumType,
    required this.function,
    required this.buttonState,
    required this.popFunction,
  });
  final String selectedHour;
  final String datetime;
  final String stadiumType;
  final Function(BookingModel model) function;
  final Function popFunction;
  final Statuses buttonState;

  @override
  State<BookingDialog> createState() => _BookingDialogState();
}

class _BookingDialogState extends State<BookingDialog> {
  late final TextEditingController bookerController;
  late final TextEditingController phoneController;
  ValueNotifier<bool> isLocalNotifier = ValueNotifier(false);
  ValueNotifier<bool> isRegularNotifier = ValueNotifier(false);
  late final MaskTextInputFormatter phoneMaskFormatter;

  @override
  void initState() {
    super.initState();
    bookerController = TextEditingController();
    phoneMaskFormatter = Formatter.phoneMaskFormatter;
    phoneController = TextEditingController(text: '+998 ');
  }

  @override
  void dispose() {
    bookerController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colors = theme.colors;
    final textStyles = theme.textStyles;
    final locale = context.appLocale;
    final selectedTimeLabel = "${locale.selectedTime} ${widget.selectedHour}";
    final bookerLabel = locale.booker;
    final phoneNumberLabel = locale.phoneNumber;

    return Dialog(
      backgroundColor: colors.backgroundColors.scaffoldColor,
      insetPadding: const EdgeInsets.symmetric(horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              selectedTimeLabel,
              style: textStyles.heading.head6,
            ),
            BuildBookingRow(
              label: bookerLabel,
              child: CustomInputField(
                controller: bookerController,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
              ),
            ),
            BuildBookingRow(
              label: phoneNumberLabel,
              child: CustomInputField(
                controller: phoneController,
                textInputType: TextInputType.phone,
                inputFormatters: [
                  phoneMaskFormatter,
                ],
                maxLength: 17,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
              ),
            ),
            ValueListenableBuilder(
              valueListenable: isLocalNotifier,
              builder: (
                context,
                value,
                _,
              ) {
                return BuildBookingSwitch(
                  label: locale.isLocalLabel,
                  value: value,
                  onChanged: (value) {
                    isLocalNotifier.value = value;
                  },
                );
              },
            ),
            ValueListenableBuilder(
              valueListenable: isRegularNotifier,
              builder: (
                context,
                value,
                _,
              ) {
                return BuildBookingSwitch(
                  label: locale.isRegularLabel,
                  value: value,
                  onChanged: (value) {
                    isRegularNotifier.value = value;
                  },
                );
              },
            ),
            CustomButton(
              isLoading: widget.buttonState.isLoading,
              text: locale.book,
              function: () {
                final bookModel = BookingModel(
                  hour: widget.selectedHour,
                  stadiumType: widget.stadiumType,
                  datetime: widget.datetime,
                  bookerName: bookerController.text,
                  phoneNumber: phoneController.text,
                  isLocal: isLocalNotifier.value,
                  isConstant: isRegularNotifier.value,
                );
                widget.function(bookModel);
              },
              buttonColor: colors.buttonColors.bgPrimary,
              textStyle: textStyles.heading.head6.copyWith(
                color: colors.textColors.whiteTextColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
