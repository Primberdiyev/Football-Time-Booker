import 'package:auth/auth.dart';
import 'package:common_base/common_base.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
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
                locale.welcome,
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
                controller: passwordController,
                hintText: locale.enterPassword,
                imagePath: Assets.icons.lock,
              ),
              Spacer(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: 60,
            right: 25,
            left: 25,
          ),
          child: BlocConsumer<AuthBloc, AuthState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state.signInStatus.isLoading,
                text: locale.login,
                function: () {
                  final login = loginController.text;
                  final password = passwordController.text;
                  final isEmpty = login.isEmpty | password.isEmpty;
                  if (isEmpty) {
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
            listenWhen: (previous, current) =>
                previous.signInStatus != current.signInStatus,
            listener: (context, state) {
              if (state.signInStatus.isError) {
                context.showSnackBar(
                  text: locale.errorWhileAuth,
                  color: colors.backgroundColors.snackbarBgColor,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
