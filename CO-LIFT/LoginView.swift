//
//  LoginView.swift
//  CO-LIFT
//
//  Created by Ishnu Suresh on 2022-07-31.
//

import SwiftUI
import Firebase

struct LoginView: View{
    @StateObject var viewRouter: ViewRouter
    @StateObject var appViewModel: AppViewModel
    
    @State private var Email:String = ""
    @State private var Password:String = ""
    
    var body: some View{
        ZStack{
            Color("Turquoise").ignoresSafeArea()
            
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.white], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 1000, height: 400)
                .rotationEffect(.degrees(135))
                .offset(y:-350)
            
            VStack{
                Text("Welcome To")
                    .foregroundColor(.white)
                    .font(.custom("RobotoSlab-Regular", size: 60.0))
                    .multilineTextAlignment(.center)
                    .padding(.top, 30.0)
                Text("CO-LIFT")
                    .foregroundColor(Color("Turquoise"))
                    .font(.custom("RobotoSlab-Bold", size: 60.0))
                    .multilineTextAlignment(.center)
                Spacer()
                VStack{
                    Text("Email")
                        .foregroundColor(.black)
                        .font(.custom("RobotoSlab-Regular", size: 20.0))
                        .padding(.trailing, 318.0)
                    
                    TextField("ex. example@gmail.com", text: $Email)
                        .padding(.all, 10.0)
                        .frame(width: 375.0, height: 50.0)
                        .border(Color.black, width: 3.0)
                        .background(Color.white)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    Text("Password")
                        .foregroundColor(.black)
                        .font(.custom("RobotoSlab-Regular", size: 20.0))
                        .padding(.trailing, 282.0)
                    
                    SecureField("CO-LIFT", text: $Password)
                        .padding(.all, 10.0)
                        .frame(width: 375.0, height: 50.0)
                        .border(Color.black, width: 3.0)
                        .background(Color.white)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        
                }
                Spacer()
                Button {
                    signIn(email: Email, password: Password)
                    print("Signed In: \(appViewModel.signedIn)")
                } label: {
                    Text("Login")
                        .foregroundColor(Color.white)
                        .font(.custom("RobotoSlab-Bold", size: 25.0))
                        .padding(.all, 10.0)
                        .padding(.horizontal, 90.0)
                        .background(.black).cornerRadius(25.0)
                }
                Spacer()
                Button {
                    viewRouter.currentPage = .SignUp
                } label: {
                    Text("Don't Have An Account? Sign Up!")
                        .foregroundColor(Color.white)
                        .font(.custom("RobotoSlab-Bold", size: 20.0))
                        .padding(.all, 10.0)
                        .padding(.horizontal, 60.0)
                }
                
                Spacer()
            }
        }
    }
    
    func signIn(email: String, password: String){
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            guard self != nil else {return}
            if let error = error{
                print(error.localizedDescription)
            }
            
            switch authResult {
            case .none:
                print("Could not sign in user.")
            case .some(_):
                print("User signed in")
                appViewModel.signedIn = true
                withAnimation {
                    viewRouter.currentPage = .MyJourney
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewRouter: ViewRouter(), appViewModel: AppViewModel())
    }
}
