//
//  TimerView.swift
//  CO-LIFT
//
//  Created by Ishnu Suresh on 2022-07-28.
//

import SwiftUI

class TimerManager: ObservableObject{
    @Published var timerMode:TimerMode = .initial
    @Published var secondsLeft = UserDefaults.standard.integer(forKey: "timerLength")
    
    var timer = Timer()
    
    func start(){
        timerMode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            if self.secondsLeft == 0{
                self.reset()
            } else {
                self.secondsLeft -= 1
            }
        })
    }
    
    func reset(){
        self.timerMode = .initial
        self.secondsLeft = UserDefaults.standard.integer(forKey: "timerLength")
        timer.invalidate()
    }
    
    func pause(){
        self.timerMode = .paused
        timer.invalidate()
    }
    
    func setTimerLength(minutes:Int){
        let defaults = UserDefaults.standard
        defaults.setValue(minutes, forKey: "timerLength")
        secondsLeft = minutes
    }
}

struct TimerView: View {
    
    @StateObject var viewRouter: ViewRouter
    @StateObject var timerManager: TimerManager
    
    @State var timerMode:TimerMode = .initial
    @State var selectedPickerIndex = 0
    
    let availableMinutes = Array(1...59)
    
    var body: some View {
        
        ZStack{
            Color("Turquoise").ignoresSafeArea()
            
            VStack{
                Text("\(secondsToMinutesAndSeconds(seconds: timerManager.secondsLeft))")
                    .font(.custom("RobotoSlab-Regular", size: 80))
                    .padding(.top, 80)
                    .foregroundColor(.white)
                Image(systemName: timerManager.timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                    .foregroundColor(.white)
                    .onTapGesture {
                        
                        if timerManager.timerMode == .initial{
                            timerManager.setTimerLength(minutes: availableMinutes[selectedPickerIndex] * 60)
                        }
                        
                        timerManager.timerMode == .running ? timerManager.pause() : timerManager.start()
                    }
                
                if timerManager.timerMode == .paused{
                    Image(systemName: "gobackward")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .foregroundColor(.white)
                        .padding(.top, 40)
                        .onTapGesture {
                            timerManager.reset()
                        }
                }
                
                if timerManager.timerMode == .initial{
                    Picker(selection: $selectedPickerIndex, label: Text("")) {
                        ForEach(0 ..< availableMinutes.count){
                            Text("\(availableMinutes[$0]) Minutes")
                        }
                    }
                    .pickerStyle(.inline)
                }
                Spacer()
                Button {
                    viewRouter.currentPage = .Tasks
                } label: {
                    Text("Return To Tasks")
                        .padding(.all, 15)
                        .font(.custom("RobotoSlab-Regular", size: 20))
                        .background(.black)
                        .foregroundColor(.white)
                }
                Spacer()
            }
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(viewRouter: ViewRouter(), timerManager: TimerManager())
    }
}
