import 'package:flutter/material.dart';
import 'package:recipes_project/dummy_data.dart';
import 'package:recipes_project/models/food.dart';

class Recipe extends StatefulWidget {
  const Recipe({super.key});

  @override
  State<Recipe> createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> argRecipe =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    List<Food> filteredFood = dummy_food.where(
      (food) {
        return food.category.contains(argRecipe['id']);
      },
    ).toList();

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          argRecipe["title"],
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: filteredFood.length,
          itemBuilder: (context, index) {
            final food = filteredFood[index];

            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/detail", arguments: {
                  'title': food.title,
                  'ingredients': food.ingredients,
                });
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: NetworkImage(food.imageUrl),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            food.title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.timer_outlined,
                                    color: Colors.red,
                                  ),
                                  Text(
                                    ' ${food.duration} mins',
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    setState(() {});
                                    isFav = !isFav;
                                    food.isFavorite = !isFav;
                                  });
                                },
                                icon: Icon(
                                  food.isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.redAccent,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
//07:08