import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sake/domain/entity/article/output/output_article.dart';
import 'package:sake/domain/entity/prefecture/prefecture.dart';
import 'package:sake/feature/controller/article/article_controller.dart';
import 'package:sake/presentation/widgets/round_rect_button.dart';
import 'package:sake/provider/current_user_provider.dart';
import 'package:sake/provider/loading_state_provider.dart';
import 'package:sake/theme/app_color_scheme.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ArticleUpdView extends HookConsumerWidget {
  const ArticleUpdView({
    super.key,
    required this.recOpArticle,
  });

  final OutputArticle recOpArticle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = useMemoized(() => GlobalKey<FormBuilderState>(), []);
    final articleProvider = ref.watch(articleControllerProvider);
    final loadingProvider = ref.read(loadingStateProvider.notifier);
    final currentUser = ref.watch(currentUserProvider);

    FocusScopeNode currentFocus = FocusScope.of(context);

    final lstImageState = useState(<String?>[]);
    final intValuation = useState<int>(0);
    final isFormValid = useState<bool>(false);

    void onChangedFormValid() {
      isFormValid.value =
          form.currentState!.fields['sakename']!.value != null &&
              form.currentState!.fields['prefecture']!.value != null &&
              lstImageState.value.isNotEmpty &&
              intValuation.value != 0;
    }

    useEffect(() {
      lstImageState.value = recOpArticle.imageURL.isNotEmpty
          ? recOpArticle.imageURL
          : <String?>[];
      return () {};
    }, []);

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
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: FormBuilder(
                    key: form,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'お酒名',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 6),
                            FormBuilderTextField(
                              name: 'sakename',
                              keyboardType: TextInputType.name,
                              cursorColor:
                                  AppColorSchemes.lightColorScheme.background,
                              validator: FormBuilderValidators.compose(
                                [
                                  FormBuilderValidators.required(
                                      errorText: '入力してください'),
                                ],
                              ),
                              initialValue: recOpArticle.sake.sakeName,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColorSchemes
                                        .lightColorScheme.outline,
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColorSchemes
                                        .lightColorScheme.primary,
                                    width: 1,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        AppColorSchemes.lightColorScheme.error,
                                    width: 1,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        AppColorSchemes.lightColorScheme.error,
                                    width: 1,
                                  ),
                                ),
                              ),
                              onChanged: (_) => onChangedFormValid(),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '評価（必須）',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 6),
                            SizedBox(
                              width: double.infinity,
                              child: RatingBar.builder(
                                itemCount: 5,
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                initialRating:
                                    recOpArticle.valuation.toDouble(),
                                onRatingUpdate: (rating) {
                                  intValuation.value = rating.toInt();
                                  onChangedFormValid();
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '画像（必須）',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 6),
                            _ContentEditor(
                              imageUrl: lstImageState.value.firstOrNull,
                              onImageSelected: (file) {
                                lstImageState.value = [file?.path];
                                onChangedFormValid();
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '産地',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 6),
                            FormBuilderDropdown(
                              name: 'prefecture',
                              validator: FormBuilderValidators.compose(
                                [
                                  FormBuilderValidators.required(
                                      errorText: '選択してください'),
                                ],
                              ),
                              initialValue: recOpArticle.sake.prefectureId,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColorSchemes
                                        .lightColorScheme.outline,
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColorSchemes
                                        .lightColorScheme.primary,
                                    width: 1,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        AppColorSchemes.lightColorScheme.error,
                                    width: 1,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        AppColorSchemes.lightColorScheme.error,
                                    width: 1,
                                  ),
                                ),
                              ),
                              items: articleProvider.lstPrefecture
                                  .map<DropdownMenuItem<String>>(
                                (Prefecture value) {
                                  return DropdownMenuItem<String>(
                                    value: value.prefectureId,
                                    child: Text(value.prefectureNameJp),
                                  );
                                },
                              ).toList(),
                              onChanged: (_) => onChangedFormValid(),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'メモ',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 6),
                            FormBuilderTextField(
                              name: 'content',
                              maxLines: 3,
                              keyboardType: TextInputType.name,
                              initialValue: recOpArticle.contents,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColorSchemes
                                        .lightColorScheme.outline,
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColorSchemes
                                        .lightColorScheme.primary,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 36),
                        SizedBox(
                          // 画面の0.8倍の横幅
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: RoundRectButton(
                            onPressed: () async {
                              if (lstImageState.value.isEmpty) {
                                return;
                              }
                              loadingProvider.startLoading();
                              await ref
                                  .read(articleControllerProvider.notifier)
                                  .regArticle(
                                    userId: currentUser.value!.uid,
                                    sakeName: form.currentState!
                                        .fields['sakename']!.value as String,
                                    valuation: intValuation.value,
                                    image: File(lstImageState.value.first!),
                                    prefectureId: form.currentState!
                                        .fields['prefecture']!.value as String,
                                    contents: form.currentState!
                                            .fields['content']!.value ??
                                        '',
                                  );
                              // ignore: use_build_context_synchronously
                              context.pop();
                              loadingProvider.stopLoading();
                            },
                            title: '新規登録',
                            isActive: isFormValid.value,
                          ),
                        ),
                      ],
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

class _ContentEditor extends ConsumerWidget {
  const _ContentEditor({
    this.imageUrl,
    required this.onImageSelected,
  });

  final String? imageUrl;
  final ValueChanged<File?> onImageSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () async {
        final path =
            await ref.read(articleControllerProvider.notifier).select();
        if (path != null) {
          onImageSelected(path);
        }
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColorSchemes.lightColorScheme.outline,
              borderRadius: BorderRadius.circular(8),
            ),
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            child: const Column(
              children: [
                Icon(
                  Icons.add_photo_alternate_outlined,
                  size: 72,
                  color: Colors.white,
                ),
                SizedBox(height: 24),
                Text(
                  '写真を選択する',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          if (imageUrl != null) ...[
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.file(
                  File(imageUrl!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              right: 8,
              top: 8,
              child: InkWell(
                onTap: () => onImageSelected(null),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(4),
                  child: const Icon(
                    Icons.close,
                    size: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
