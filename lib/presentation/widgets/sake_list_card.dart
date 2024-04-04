import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sake/domain/entity/article/output/output_article.dart';
import 'package:sake/theme/app_color_scheme.dart';

class ArticleListCard extends HookConsumerWidget {
  const ArticleListCard({
    Key? key,
    required this.recOpArticle,
    required this.onTap,
  }) : super(key: key);

  final OutputArticle recOpArticle;
  final void Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        color: AppColorSchemes.lightColorScheme.onSecondary,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                      recOpArticle.imageURL[0],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recOpArticle.sake.sakeName,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColorSchemes.lightColorScheme.onPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColorSchemes.lightColorScheme.background,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        recOpArticle.location,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColorSchemes.lightColorScheme.onPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    // recOpArticle.valuationの数だけ黄色の星をだすマックス5段階評価で残りは灰色の星にする
                    Container(
                      padding: const EdgeInsets.all(4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '評価',
                            style: TextStyle(fontSize: 12),
                          ),
                          Row(
                            children: [
                              for (int i = 0; i < recOpArticle.valuation; i++)
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 25,
                                ),
                              for (int i = 0;
                                  i < 5 - recOpArticle.valuation;
                                  i++)
                                const Icon(
                                  Icons.star,
                                  color: Colors.grey,
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
