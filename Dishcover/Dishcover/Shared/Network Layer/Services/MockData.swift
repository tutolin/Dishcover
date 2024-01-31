//
//  MockData.swift
//  Dishcover
//
//  Created by Tolulope Aboyeji on 31/01/2024.
//

import Foundation

let mock_meal_list: Data = """
    [
      {
         "strMeal":"Sugar Pie",
         "strMealThumb":"https://www.themealdb.com/images/media/meals/yrstur1511816601.jpg",
         "idMeal":"52931"
      },
      {
         "strMeal":"Summer Pudding",
         "strMealThumb":"https://www.themealdb.com/images/media/meals/rsqwus1511640214.jpg",
         "idMeal":"52889"
      },
      {
         "strMeal":"Tarte Tatin",
         "strMealThumb":"https://www.themealdb.com/images/media/meals/ryspuw1511786688.jpg",
         "idMeal":"52909"
      },
      {
         "strMeal":"Timbits",
         "strMealThumb":"https://www.themealdb.com/images/media/meals/txsupu1511815755.jpg",
         "idMeal":"52929"
      },
      {
         "strMeal":"Treacle Tart",
         "strMealThumb":"https://www.themealdb.com/images/media/meals/wprvrw1511641295.jpg",
         "idMeal":"52892"
      },
      {
         "strMeal":"Tunisian Orange Cake",
         "strMealThumb":"https://www.themealdb.com/images/media/meals/y4jpgq1560459207.jpg",
         "idMeal":"52970"
      },
      {
         "strMeal":"Walnut Roll Guu017evara",
         "strMealThumb":"https://www.themealdb.com/images/media/meals/u9l7k81628771647.jpg",
         "idMeal":"53062"
      },
      {
         "strMeal":"White chocolate creme brulee",
         "strMealThumb":"https://www.themealdb.com/images/media/meals/uryqru1511798039.jpg",
         "idMeal":"52917"
      }
   ]
""".data(using: .utf8)!


let mock_meal_details: Data = """
{
    "id": "52893",
    "strMeal": "Apple & Blackberry Crumble",
    "strInstructions": "Heat oven to 190C/170C fan/gas 5. Tip the flour and sugar into a large bowl. Add the butter, then rub into the flour using your fingertips to make a light breadcrumb texture. Do not overwork it or the crumble will become heavy. Sprinkle the mixture evenly over a baking sheet and bake for 15 mins or until lightly coloured.\r\nMeanwhile, for the compote, peel, core and cut the apples into 2cm dice. Put the butter and sugar in a medium saucepan and melt together over a medium heat. Cook for 3 mins until the mixture turns to a light caramel. Stir in the apples and cook for 3 mins. Add the blackberries and cinnamon, and cook for 3 mins more. Cover, remove from the heat, then leave for 2-3 mins to continue cooking in the warmth of the pan.\r\nTo serve, spoon the warm fruit into an ovenproof gratin dish, top with the crumble mix, then reheat in the oven for 5-10 mins. Serve with vanilla ice cream.",
    "strMealThumb": "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg",
    "ingredients": [
      "Plain Flour",
      "Caster Sugar",
      "Butter",
      "Braeburn Apples",
      "Butter",
      "Demerara Sugar",
      "Blackberrys",
      "Cinnamon",
      "Ice Cream"
    ],
    "measures": [
      "120g",
      "60g",
      "60g",
      "300g",
      "30g",
      "30g",
      "120g",
      "¼ teaspoon",
      "to serve"
    ]
  }
""".data(using: .utf8)!
