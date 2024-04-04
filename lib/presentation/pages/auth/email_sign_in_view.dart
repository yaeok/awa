// ignore_for_file: use_build_context_synchronously

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sake/feature/controller/auth/auth_controller.dart';
import 'package:sake/presentation/widgets/round_rect_button.dart';
import 'package:sake/provider/loading_state_provider.dart';
import 'package:sake/router/router_path.dart';
import 'package:sake/theme/app_color_scheme.dart';

class EmailSignInView extends HookConsumerWidget {
  const EmailSignInView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailFormKey = useMemoized(() => GlobalKey<FormBuilderState>(), []);
    final passwordFormKey =
        useMemoized(() => GlobalKey<FormBuilderState>(), []);

    final loadingProvider = ref.read(loadingStateProvider.notifier);

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 54),
                FormBuilder(
                  key: emailFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('メールアドレス', style: TextStyle(fontSize: 12)),
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
                          FormBuilderValidators.required(errorText: '入力してください'),
                          FormBuilderValidators.email(
                              errorText: 'メールの形式が正しくありません'),
                        ]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                FormBuilder(
                  key: passwordFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('パスワード', style: TextStyle(fontSize: 12)),
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
                              color: AppColorSchemes.lightColorScheme.primary),
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
                const SizedBox(height: 18),
                SizedBox(
                  width: double.infinity,
                  child: RoundRectButton(
                    title: 'ログイン',
                    onPressed: () async {
                      loadingProvider.startLoading();
                      try {
                        await ref
                            .read(authControllerProvider.notifier)
                            .signInWithEmail(
                              email: emailFormKey
                                  .currentState!.fields['email']!.value,
                              password: passwordFormKey
                                  .currentState!.fields['password']!.value,
                            );
                      } catch (e) {
                        String errorMessage = 'エラーが発生しました。後ほど再試行してください。';
                        if (e is String) {
                          switch (e) {
                            case 'invalid-email':
                              errorMessage = 'メールアドレスのフォーマットが正しくありません';
                              break;
                            case 'user-disabled':
                              errorMessage = '現在指定したメールアドレスは使用できません';
                              break;
                            case 'user-not-found':
                              errorMessage = '指定されたメールアドレスは登録されていません';
                              break;
                            case 'wrong-password':
                              errorMessage = 'パスワードが間違っています';
                              break;
                            case 'too-many-requests':
                              errorMessage = 'アカウントがロックされています';
                              break;
                          }
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(errorMessage)),
                        );
                      } finally {
                        loadingProvider.stopLoading();
                      }
                    },
                    isActive: isFormValid,
                  ),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () {
                    context.go(RouterPath.signUpViewRoute);
                  },
                  child: Text(
                    'アカウントをお持ちでない方はこちら',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColorSchemes.lightColorScheme.inverseSurface,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('パスワードを忘れた場合'),
                          content: const Text(
                              '管理者にお問い合わせください[はい]を選択すると問い合わせ先がコピーされます。'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Clipboard.setData(
                                  const ClipboardData(
                                    text: 'yaeok.engineer@gmail.com',
                                  ),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('コピーしました'),
                                  ),
                                );
                                Navigator.pop(context);
                              },
                              child: const Text('はい'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('いいえ'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    'パスワードをお忘れの方はこちら',
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
    );
  }
}
