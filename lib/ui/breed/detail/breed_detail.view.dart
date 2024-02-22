import 'package:cat_breeds/domain/breed/model/breed.model.dart';
import 'package:cat_breeds/infrastructure/localization/locale.utils.dart';
import 'package:cat_breeds/styles/text.styles.dart';
import 'package:cat_breeds/ui/common/chip_builder.widget.dart';
import 'package:cat_breeds/ui/common/labeled.widget.dart';
import 'package:cat_breeds/ui/common/stars.widget.dart';
import 'package:flutter/material.dart';

class BreedDetailViewParams {
  final CatBreed breed;

  BreedDetailViewParams(this.breed);
}

class BreedDetailView extends StatelessWidget {
  final BreedDetailViewParams params;

  const BreedDetailView({required this.params, super.key});

  @override
  Widget build(BuildContext context) {
    final breed = params.breed;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          breed.name,
          style: TextStyles.titleWhiteStyle,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                breed.imagePath!,
                fit: BoxFit.fitWidth,
              )),
          Expanded(
            child: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(15),
              child: _detailContent(context),
            )),
          )
        ],
      ),
    );
  }

  Widget _detailContent(BuildContext context) {
    final breed = params.breed;
    final loc = context.loc();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Labeled(
            isHorizontal: false,
            label: loc.description,
            child: Text(breed.description)),
        Labeled(label: loc.country, child: Text(breed.origin)),
        Labeled(
            label: loc.life_span,
            child: Text(loc.life_span_format(breed.lifeSpan))),
        Labeled(
          label: loc.intelligence,
          child: StarsRanking(ranking: breed.intelligence),
        ),
        Labeled(
          label: loc.child_friendly,
          child: StarsRanking(ranking: breed.childFriendly),
        ),
        Labeled(
          label: loc.dog_friendly,
          child: StarsRanking(ranking: breed.dogFriendly),
        ),
        Labeled(
          label: loc.adaptability,
          child: StarsRanking(ranking: breed.adaptability),
        ),
        Labeled(
          isHorizontal: false,
          label: loc.temperament,
          child: PragmaChipBuilder(
            chips: breed.temperament,
          ),
        )
      ],
    );
  }
}
