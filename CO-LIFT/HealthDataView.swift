//
//  HealthDataView.swift
//  CO-LIFT
//
//  Created by Ishnu Suresh on 2022-07-29.
//

import FirebaseFirestore
import SwiftUI
import Firebase
import Foundation

class userInformation: ObservableObject{
    //Progression Data
    @Published var selectedHoursOfSleep:Int = 0
    @Published var selectedMinutesOfExercise:Int = 0
    @Published var selectedAmountOfDrinks:Int = 0
    @Published var consistentDays:Int = 0
    
    //Login Data
    @Published var dateOfBirth:String = ""
    @Published var name:String = ""
    @Published var email:String = ""
    
    //Goal Data
    @Published var goal:String = ""
    
    //Tasks Data
    @Published var tasksCompleted:Int = 0
    @Published var didUserExercise:Bool = false
    @Published var didUserMeditate:Bool = false
    
    //Tasks Visual Data -- Not Included In Firebase Database
    @Published var circleProgress:CGFloat = 0.00
    @Published var numberOfTasksCompleted: Int = 0
    
    //Progression Data -- Not Included In Firebase Database
    @Published var yesterdayHoursOfSleep:Int = 0
    @Published var yesterdayMinutesOfExercise:Int = 0
    @Published var yesterdayAmountOfDrinks:Int = 0
    
    @Published var userInformationList = [User]()
    
    func updateData(userToUpdate: User, dateOfBirth:String, didUserExercise:Bool, didUserMeditate:Bool, email:String, goal:String, hoursSlept:Int, minutesExercised:Int, name:String, numberOfDaysConsistent:Int, numberOfDrinksConsumed:Int, tasksCompleted:Int){
        
        let db = Firestore.firestore()
        
        db.collection("Users").document(userToUpdate.id).setData(["dateOfBirth":dateOfBirth, "didUserExercise":didUserExercise, "didUserMeditate":didUserMeditate, "email":email, "goal":goal, "hoursSlept":hoursSlept, "minutesExercised":minutesExercised, "name":name, "numberOfDaysConsistent":numberOfDaysConsistent, "tasksCompleted":tasksCompleted])
    }
    
    func deleteData(userToDelete: User){
        
        //Reference To Database
        let db = Firestore.firestore()
        
        //Specify The Document To Delete
        db.collection("Users").document(userToDelete.id).delete { error in
            //Check For Errors
            
            DispatchQueue.main.async {
                if error == nil{
                    self.userInformationList.removeAll { user in
                        return user.id == userToDelete.id
                    }
                }
            }
        }
    }
    
    func addData(dateOfBirth:String, didUserExercise:Bool, didUserMeditate:Bool, email:String, goal:String, hoursSlept:Int, minutesExercised:Int, name:String, numberOfDaysConsistent:Int, numberOfDrinksConsumed:Int, tasksCompleted:Int){
        
        //Reference to Database
        let db = Firestore.firestore()
        
        //Add A Document To The Collection
        db.collection("Users").addDocument(data: ["dateOfBirth":dateOfBirth, "didUserExercise":didUserExercise, "didUserMeditate":didUserMeditate, "email":email, "goal":goal, "hoursSlept":hoursSlept, "minutesExercised":minutesExercised, "name":name, "numberOfDaysConsistent":numberOfDaysConsistent, "tasksCompleted":tasksCompleted]) { error in
            
            //Check For Errors
            if error == nil{
                //No Errors
                self.getData()
            } else{
                //Handle The Error
            }
        }
    }
    
    func getData(){
        //Get A Reference To The Database
        let db = Firestore.firestore()
        
        //Read Documents At A Specific Path
        db.collection("Users").getDocuments { snapshot, error in
            //Check For Error
            if error == nil{
                //No Errors
                if let snapshot = snapshot {
                    
                    //Update List Property In Main Thread
                    DispatchQueue.main.async {
                        
                        //Get All Documents
                        self.userInformationList =  snapshot.documents.map { d in
                            
                            //Create A User Item For Each Document
                            return User(id: d.documentID, dateOfBirth: d["dateOfBrith"] as? String ?? "", didUserExercise: d["didUserExercise"] as? Bool ?? false, didUserMeditate: d["didUserMeditate"] as? Bool ?? false, email: d["email"] as? String ?? "", goal: d["goal"] as? String ?? "", hoursSlept: d["hoursSlept"] as? Int ?? 0, minutesExercised: d["minutesExercised"] as? Int ?? 0, name: d["name"] as? String ?? "", numberOfDaysConsistent: d["numberOfDaysConsistent"] as? Int ?? 0, numberOfDrinksConsumed: d["numberOfDrinksConsumed"] as? Int ?? 0, tasksCompleted: d["tasksCompleted"] as? Int ?? 0)
                        }
                    }
                }
            } else {
                //Handle The Error
            }
        }
    }
}

struct HealthDataView: View {
    
    @StateObject var viewRouter: ViewRouter
    @ObservedObject var Information: userInformation
    
    var hours = Array(0...12)
    var minutes = Array(0...120)
    var drinks = Array(0...10)
    
    var body: some View {
        VStack{
            Text("Please Enter Your Health Data")
                .foregroundColor(.black)
                .font(.custom("RobotoSlab-Regular", size: 30))
                .multilineTextAlignment(.center)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                .foregroundColor(.black)
                .font(.custom("RobotoSlab-Regular", size: 15))
                .multilineTextAlignment(.center)
                .padding(.top, 1)
            Spacer()
            Spacer()
            VStack{
                Text("For How Many Hours Did You Sleep Today?")
                    .foregroundColor(.black)
                    .font(.custom("RobotoSlab-Regular", size: 15))
                    .multilineTextAlignment(.leading)
                    .padding(.trailing, 60.0)
                    .frame(width: 375.0)
                
                Picker("Hours of Sleep", selection: $Information.selectedHoursOfSleep){
                    ForEach(hours, id: \.self) {
                        Text("\($0.formatted(.number.grouping(.never))) Hour(s) of Sleep")
                        }
                }
                .frame(width:375, height: 100.0)
                .pickerStyle(MenuPickerStyle())
                .accentColor(.black)
                .border(.black, width: 3.0)
                Spacer()
                Text("For How Many Minutes Did You Exercise Today?")
                    .foregroundColor(.black)
                    .font(.custom("RobotoSlab-Regular", size: 15))
                    .multilineTextAlignment(.leading)
                    .padding(.trailing, 30.0)
                    .frame(width: 375.0, height: 30.0)
                
                Picker("Minutes of Exercise", selection: $Information.selectedMinutesOfExercise){
                    ForEach(minutes, id: \.self) {
                        Text("\($0.formatted(.number.grouping(.never))) Minute(s) of Exercise")
                        }
                }
                .frame(width:375, height: 100.0)
                .pickerStyle(MenuPickerStyle())
                .accentColor(.black)
                .border(.black, width: 3.0)
                
                Spacer()
                Text("How Many Drinks Did You Have Today?")
                    .foregroundColor(.black)
                    .font(.custom("RobotoSlab-Regular", size: 15))
                    .multilineTextAlignment(.leading)
                    .padding(.trailing, 90.0)
                
                Picker("Alcohol Intake", selection: $Information.selectedAmountOfDrinks){
                    ForEach(drinks, id: \.self) {
                        Text("\($0.formatted(.number.grouping(.never))) Drink(s)")
                        }
                }
                .frame(width:375, height: 100.0)
                .pickerStyle(MenuPickerStyle())
                .accentColor(.black)
                .border(.black, width: 3.0)
                Spacer()
                
            }
            Button {
                if Information.selectedHoursOfSleep >= Information.yesterdayHoursOfSleep && Information.selectedMinutesOfExercise >= Information.yesterdayMinutesOfExercise && Information.selectedAmountOfDrinks <= Information.yesterdayAmountOfDrinks{
                    Information.consistentDays += 1
                }
                viewRouter.currentPage = .Goal
            } label: {
                Text("Confirm")
                    .foregroundColor(.white)
                    .font(.custom("RobotoSlab-Regular", size: 20))
            }
            .padding(.all, 20)
            .padding(.horizontal, 70)
            .background(Color.black)
            
            Spacer()
        }
    }
}

struct HealthDataView_Previews: PreviewProvider {
    static var previews: some View {
        HealthDataView(viewRouter: ViewRouter(), Information: userInformation())
    }
}
