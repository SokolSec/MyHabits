//
//  Post.swift
//  MyHabits
//
//  Created by Даниил Сокол on 10.04.2022.
//

import Foundation
import UIKit
 
struct Post {
    let nameOfTheHabit : String
    let atWhatTime : String
    let counter : String
    
    static func publications() -> [Post] {
        var publications = [Post]()
        publications.append(Post(nameOfTheHabit: "Выпить стакан воды", atWhatTime: "Каждый день в ", counter: "Счетчик: "))
    
        return publications
    }
}
