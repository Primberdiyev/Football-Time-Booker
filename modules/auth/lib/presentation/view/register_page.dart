import 'package:auth/auth.dart';
import 'package:common_base/common_base.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.router});
  final AuthRouter router;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late String? selectedValue;
  late final List<String> items;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final locale = context.appLocale;
    items = [
      locale.user,
      locale.fieldCreator,
    ];
    selectedValue = items.first;
  }

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = context.appLocale;
    final theme = context.theme;
    final colors = theme.colors;
    final textStyles = theme.textStyles;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Spacer(),
              Text(
                locale.fcBoston,
                style: textStyles.heading.head1,
              ),
              Text(
                locale.register,
                style: textStyles.heading.head6.copyWith(
                  color: colors.textColors.hintTextColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: CustomInputField(
                  controller: loginController,
                  hintText: locale.enterLogin,
                  imagePath: Assets.icons.profile,
                ),
              ),
              CustomInputField(
                controller: nameController,
                hintText: locale.enterName,
                imagePath: Assets.icons.profile,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: CustomInputField(
                  controller: passwordController,
                  hintText: locale.enterPassword,
                  imagePath: Assets.icons.lock,
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: colors.inputFieldColors.bgNotActiveColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: colors.inputFieldColors.iconFieldEmptyColor,
                    width: 1,
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: colors.textColors.whiteTextColor,
                      ),
                    ),
                    isExpanded: true,
                    value: selectedValue,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          selectedValue = value;
                        });
                      }
                    },
                    hint: Text(
                      locale.user,
                      style: textStyles.body.bLBody16.copyWith(
                        color: colors.textColors.hintTextColor,
                      ),
                    ),
                    buttonStyleData: ButtonStyleData(
                      height: 56,
                      padding: const EdgeInsets.only(left: 0, right: 0),
                    ),
                    iconStyleData: IconStyleData(
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: colors.inputFieldColors.iconFieldEmptyColor,
                      ),
                      iconSize: 24,
                    ),
                    items: items
                        .map(
                          (String item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: textStyles.body.bLBody16.copyWith(
                                color:
                                    colors.inputFieldColors.iconFieldEmptyColor,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              //
              Spacer(),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 80,
                ),
                child: BlocConsumer<AuthBloc, AuthState>(
                  listenWhen: (previous, current) =>
                      previous.loginStatus != current.loginStatus,
                  listener: (context, state) {
                    if (state.loginStatus.isError) {
                      context.showSnackBar(
                        text: state.error?.message ?? locale.notRegisteredYet,
                        color: colors.backgroundColors.snackbarBgColor,
                      );
                    }
                    if (state.loginStatus.isSuccess) {
                      widget.router.onPushActionMain(context);
                    }
                  },
                  builder: (context, state) {
                    return CustomButton(
                      isLoading: state.loginStatus.isLoading,
                      text: locale.register,
                      function: () {
                        final login = loginController.text;
                        final password = passwordController.text;
                        final isEmpty = login.isEmpty | password.isEmpty;

                        if (isEmpty || selectedValue == null) {
                          context.showSnackBar(text: locale.fillField);
                        } else {
                          context.read<AuthBloc>().add(
                                SignInEvent(login: login, password: password),
                              );
                        }
                      },
                      buttonColor: colors.buttonColors.bgPrimary,
                      textStyle: textStyles.heading.head5.copyWith(
                        color: colors.textColors.whiteTextColor,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
