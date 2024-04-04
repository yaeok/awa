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

class EmailVerifyView extends HookConsumerWidget {
  const EmailVerifyView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailFormKey = useMemoized(() => GlobalKey<FormBuilderState>(), []);

    FocusScopeNode currentFocus = FocusScope.of(context);

    final isEmailFormValid = useState<bool>(false);

    final isFormValid = isEmailFormValid.value;

    void updateEmailFormValidity() {
      final emailValid = emailFormKey.currentState?.validate() ?? false;
      isEmailFormValid.value = emailValid;
    }

    return GestureDetector(
      onTap: () {
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColorSchemes.lightColorScheme.background,
          elevation: 0,
          leading: const SizedBox(),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'メールアドレス確認画面',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  'メールアドレスの確認が必要です。\nメールアドレスに送信されたリンクをクリックしてください。\n再送が必要な場合、下記のフォームからお願いします。',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 30),
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
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(
                                errorText: '入力してください'),
                            FormBuilderValidators.email(
                                errorText: 'メールの形式が正しくありません'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: RoundRectButton(
                          title: '再送する',
                          onPressed: () async {
                            try {
                              await ref
                                  .read(authControllerProvider.notifier)
                                  .sendEmailVerification();
                            } catch (e) {
                              String errorMessage = 'エラーが発生しました。後ほど再試行してください。';
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(errorMessage)),
                              );
                            }
                          },
                          isActive: isFormValid,
                        ),
                      ),
                      const SizedBox(height: 40),
                      SizedBox(
                        width: double.infinity,
                        child: RoundRectButton(
                          title: '確認しました',
                          onPressed: () async {
                            try {
                              context.go(RouterPath.homeViewRoute);
                            } catch (e) {
                              String errorMessage = 'エラーが発生しました。後ほど再試行してください。';
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(errorMessage)),
                              );
                            }
                          },
                        ),
                      ),
                    ],
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
