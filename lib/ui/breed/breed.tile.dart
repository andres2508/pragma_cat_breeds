import 'package:cat_breeds/domain/breed/model/breed.model.dart';
import 'package:cat_breeds/infrastructure/localization/locale.utils.dart';
import 'package:cat_breeds/styles/text.styles.dart';
import 'package:cat_breeds/ui/common/stars.widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CatBreedTile extends StatelessWidget {
  final CatBreed breed;

  const CatBreedTile({required this.breed, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push('/home/breed/detail'),
      child: Container(
        key: UniqueKey(),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    breed.name,
                    style: TextStyles.titleStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                TextButton(
                  onPressed: () => context.push('/home/breed/detail'),
                  child: Text(
                    context.loc().more,
                    style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontSize: TextStyles.normalSize),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  breed.imagePath!,
                  fit: BoxFit.fitWidth,
                )),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    breed.origin,
                    style: const TextStyle(
                      fontSize: TextStyles.subtitle1Size,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                StarsRanking(ranking: breed.intelligence)
              ],
            )
          ],
        ),
      ),
    );
  }
}
