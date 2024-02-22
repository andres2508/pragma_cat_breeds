import 'package:cat_breeds/infrastructure/localization/locale.utils.dart';
import 'package:cat_breeds/styles/color.styles.dart';
import 'package:cat_breeds/styles/text.styles.dart';
import 'package:cat_breeds/ui/breed/breed.tile.dart';
import 'package:cat_breeds/ui/breed/breed.view.model.dart';
import 'package:cat_breeds/ui/framework/provider/view.model.consumer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatBreedMainView extends StatefulWidget {
  const CatBreedMainView({super.key});

  @override
  State<CatBreedMainView> createState() => _CatBreedMainViewState();
}

class _CatBreedMainViewState extends State<CatBreedMainView> {
  final CatBreedViewModel _model = CatBreedViewModel();

  @override
  void initState() {
    super.initState();
    _model.loadRequired();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CatBreedViewModel>(
      create: (_) => _model,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            context.loc().breed_list,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            children: [
              _breedFilter(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: _breedList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _breedFilter() {
    return TextField(
      onChanged: (value) => _model.breedFilter(value),
      decoration: InputDecoration(
        hintText: context.loc().breed_filter,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        suffixIcon: const Icon(
          Icons.search,
          color: ColorStyles.darkColor,
          size: 30,
        ),
      ),
    );
  }

  Widget _breedList() {
    return ViewModelConsumer<CatBreedViewModel>(
      progressIndicator: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(
              height: 10,
            ),
            Text(context.loc().loading_breeds, style: TextStyles.normalStyle)
          ],
        ),
      ),
      builder: (_, model) {
        final items = model.items;
        return items.isNotEmpty
            ? ListView.separated(
                itemBuilder: (_, index) => CatBreedTile(breed: items[index]),
                separatorBuilder: (_, __) => const SizedBox(
                  height: 10,
                ),
                itemCount: model.items.length,
              )
            : _withoutBreeds();
      },
    );
  }

  Widget _withoutBreeds() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(context.loc().without_breed),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => _model.loadRequired(),
            child: Text(context.loc().retry),
          )
        ],
      ),
    );
  }
}
