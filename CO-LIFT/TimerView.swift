//
//  TimerView.swift
//  CO-LIFT
//
//  Created by Ishnu Suresh on 2022-07-28.
//

import SwiftUI

struct TimerView: View {
    
    @StateObject var viewRouter: ViewRouter
    @State var circleProgress:CGFloat = 0.00
    @State var countDownTimer:Int = 0
    @State var timerRunning:Bool = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        Text("\(countDownTimer)")
            .onReceive(timer){ _ in
                if countDownTimer > 0 && timerRunning{
                    countDownTimer -= 1
                } else{
                    timerRunning = false
                }
            }
            .font(.custom("RobotoSlab-Bold", size: 100.0))
            .opacity(0.80)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(viewRouter: ViewRouter())
    }
}
