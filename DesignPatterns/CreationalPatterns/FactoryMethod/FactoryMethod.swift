//
//  FactoryMethod.swift
//  DesignPatterns
//
//  Created by Maurício Sayão on 11/12/23.
//

import Foundation

enum Cuisine{
    case italian, japanese, american, chinese
}

protocol Restaurant {
    func getCuisine() -> Cuisine
    func getFood() -> String
}

final class Luigis: Restaurant {
    func getCuisine() -> Cuisine {
        .italian
    }
    
    func getFood() -> String {
        "Serving pizza"
    }
}

final class Sukiya: Restaurant {
    func getCuisine() -> Cuisine {
        .japanese
    }
    
    func getFood() -> String {
        "Serving donburi"
    }
}

final class McDonalds: Restaurant {
    func getCuisine() -> Cuisine {
        .american
    }
    
    func getFood() -> String {
        "Serving burger"
    }
}

final class KFC: Restaurant {
    func getCuisine() -> Cuisine {
        .american
    }
    
    func getFood() -> String {
        "Serving fried chicken"
    }
}

final class FoodHall {
    private var restaurants = [Cuisine: [Restaurant]]()
    
    func registerRestaurant(restaurant: Restaurant) {
        if !restaurants.keys.contains(restaurant.getCuisine()) {
            restaurants[restaurant.getCuisine()] = []
        }
        
        restaurants[restaurant.getCuisine()]?.append(restaurant)
    }
    
    func getFood(type: Cuisine) -> String? {
        restaurants[type]?.randomElement()?.getFood()
    }
}

func factoryMethodClient() {
    print(#function)
    let foodHall = FoodHall()
    foodHall.registerRestaurant(restaurant: Luigis())
    foodHall.registerRestaurant(restaurant: Sukiya())
    foodHall.registerRestaurant(restaurant: McDonalds())
    foodHall.registerRestaurant(restaurant: KFC())
    
    print(foodHall.getFood(type: .japanese) ?? String())
    print(foodHall.getFood(type: .italian) ?? String())
    print(foodHall.getFood(type: .american) ?? String())
}
