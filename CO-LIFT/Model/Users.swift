//
//  Users.swift
//  CO-LIFT
//
//  Created by Ishnu Suresh on 2022-08-03.
//

import Foundation

struct User: Identifiable{
    var id:String
    var dateOfBirth:String
    var didUserExercise:Bool
    var didUserMeditate:Bool
    var email:String
    var goal:String
    var hoursSlept:Int
    var minutesExercised:Int
    var name:String
    var numberOfDaysConsistent:Int
    var numberOfDrinksConsumed:Int
    var tasksCompleted:Int
}
