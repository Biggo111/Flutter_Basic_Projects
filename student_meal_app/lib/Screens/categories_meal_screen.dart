import 'package:flutter/material.dart';
//import 'package:student_meal_app/Widgets/meal_Item.dart';
//import 'package:student_meal_app/Widgets/category_Item.dart';
import '../dummy_data.dart';
import '../Widgets/category_Item.dart';
import '../Widgets/meal_Item.dart';

class CategoryMealScreen extends StatelessWidget {

  final String categoryId;
  final String categoryTitle;

  CategoryMealScreen(this.categoryId, this.categoryTitle);


  @override
  Widget build(BuildContext context) {

    // final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String,String>;
    // final categoryTitle = routeArgs['title'];
    // final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal){
       return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(itemBuilder: (ctx, index){
        return MealItem(
          title: categoryMeals[index].title,
          imageUrl: categoryMeals[index].imageUrl,
          duration: categoryMeals[index].duration,
          complexity: categoryMeals[index].complexity,
          affordability: categoryMeals[index].affordability,
        );
       }, itemCount: categoryMeals.length,),
    );
  }
} 