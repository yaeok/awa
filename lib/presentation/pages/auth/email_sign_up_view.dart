// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sake/feature/controller/auth/auth_controller.dart';
import 'package:sake/presentation/widgets/round_rect_button.dart';
import 'package:sake/router/router_path.dart';
import 'package:sake/theme/app_color_scheme.dart';

class EmailSignUpView extends HookConsumerWidget {
  const EmailSignUpView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailFormKey = useMemoized(() => GlobalKey<FormBuilderState>(), []);
    final passwordFormKey =
        useMemoized(() => GlobalKey<FormBuilderState>(), []);

    FocusScopeNode currentFocus = FocusScope.of(context);

    final isEmailFormValid = useState<bool>(false);
    final isPasswordFormValid = useState<bool>(false);

    final isObscure = useState<bool>(true);

    final isFormValid = isEmailFormValid.value && isPasswordFormValid.value;

    void updateEmailFormValidity() {
      final emailValid = emailFormKey.currentState?.validate() ?? false;
      isEmailFormValid.value = emailValid;
    }

    void updatePasswordFormValidity() {
      final passwordValid = passwordFormKey.currentState?.validate() ?? false;
      isPasswordFormValid.value = passwordValid;
    }

    return GestureDetector(
      onTap: () {
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 100,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    '新規アカウント作成',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 36),
                  FormBuilder(
                    key: emailFormKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'メールアドレス',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 6),
                        FormBuilderTextField(
                          name: 'email',
                          cursorColor: AppColorSchemes.lightColorScheme.primary,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (_) => updateEmailFormValidity(),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColorSchemes.lightColorScheme.outline,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColorSchemes.lightColorScheme.primary,
                                width: 1,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColorSchemes.lightColorScheme.primary,
                                width: 1,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColorSchemes.lightColorScheme.primary,
                                width: 1,
                              ),
                            ),
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                                errorText: '入力してください'),
                            FormBuilderValidators.email(
                                errorText: 'メールの形式が正しくありません'),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  FormBuilder(
                    key: passwordFormKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'パスワード',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 6),
                        FormBuilderTextField(
                          name: 'password',
                          cursorColor: AppColorSchemes.lightColorScheme.primary,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: isObscure.value,
                          onChanged: (value) => updatePasswordFormValidity(),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            suffixIcon: IconButton(
                              icon: Icon(isObscure.value
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                isObscure.value = !isObscure.value;
                              },
                              color: AppColorSchemes.lightColorScheme.primary,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColorSchemes.lightColorScheme.outline,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColorSchemes.lightColorScheme.primary,
                                width: 1,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColorSchemes.lightColorScheme.primary,
                                width: 1,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColorSchemes.lightColorScheme.primary,
                                width: 1,
                              ),
                            ),
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                              errorText: '入力してください',
                            ),
                            FormBuilderValidators.minLength(
                              8,
                              errorText: '8文字以上で入力してください',
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 36),
                  SizedBox(
                    width: double.infinity,
                    child: RoundRectButton(
                      title: 'アカウントを作成する',
                      onPressed: () async {
                        try {
                          await ref
                              .read(authControllerProvider.notifier)
                              .signUpWithEmail(
                                email: emailFormKey
                                    .currentState!.fields['email']!.value,
                                password: passwordFormKey
                                    .currentState!.fields['password']!.value,
                              );
                        } catch (e) {
                          String errorMessage = 'エラーが発生しました。後ほど再試行してください。';
                          if (e is String) {
                            switch (e) {
                              case 'user-not-found':
                                errorMessage = '指定されたメールアドレスは登録されていません';
                                break;
                              case 'wrong-password':
                                errorMessage = 'パスワードが間違っています';
                                break;
                              case 'too-many-requests':
                                errorMessage = 'アカウントがロックされています';
                                break;
                              case 'invalid-email':
                                errorMessage = 'メールアドレスのフォーマットが正しくありません';
                                break;
                              case 'weak-password':
                                errorMessage = 'パスワードが弱いため、登録できません';
                                break;
                            }
                          }
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(errorMessage)),
                          );
                        }
                      },
                      isActive: isFormValid,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () => context.go(RouterPath.signInViewRoute),
                    child: Text(
                      'アカウントをお持ちの方はこちら',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColorSchemes.lightColorScheme.inverseSurface,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
