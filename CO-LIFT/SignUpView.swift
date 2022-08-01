//
//  SignUpView.swift
//  CO-LIFT
//
//  Created by Ishnu Suresh on 2022-07-26.
//

import SwiftUI
import Firebase

class AppViewModel: ObservableObject{
    
    @Published var signedIn:Bool = false
    
    var userIsLoggedIn:Bool {
        return Auth.auth().currentUser != nil
    }
    
    func signUp(email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else{
                return
            }
            // Success
        }
    }
    
    func signOut(){
        try? Auth.auth().signOut()
        
        self.signedIn = false
    }
}

struct SignUpView: View{
    @StateObject var viewRouter: ViewRouter
    @StateObject var appViewModel: AppViewModel
    
    @State private var Name:String = ""
    @State private var dateOfBirth:String = ""
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
                    .foregroundColor(Color("Turquoise"))
                    .font(.custom("RobotoSlab-Regular", size: 60.0))
                    .multilineTextAlignment(.center)
                    .padding(.top, 30.0)
                Text("CO-LIFT")
                    .foregroundColor(Color("Turquoise"))
                    .font(.custom("RobotoSlab-Bold", size: 60.0))
                    .multilineTextAlignment(.center)
                Spacer()
                VStack{
                    Text("Name")
                        .foregroundColor(.black)
                        .font(.custom("RobotoSlab-Regular", size: 20.0))
                        .padding(.trailing, 318.0)
    
                    TextField("ex. John Doe", text: $Name)
                        .padding(.all, 10.0)
                        .frame(width: 375.0, height: 50.0)
                        .border(Color.black, width: 3.0)
                        .background(Color.white)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    Text("Date Of Birth")
                        .foregroundColor(.black)
                        .font(.custom("RobotoSlab-Regular", size: 20.0))
                        .padding(.trailing, 255.0)
                    
                    TextField("ex. July 26, 2022", text: $dateOfBirth)
                        .padding(.all, 10.0)
                        .frame(width: 375.0, height: 50.0)
                        .border(Color.black, width: 3.0)
                        .background(Color.white)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
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
                    
                    guard !Email.isEmpty, !Password.isEmpty else{
                        return 
                    }
                    
                    appViewModel.signUp(email: Email, password: Password)
                    viewRouter.currentPage = .Login
                } label: {
                    Text("Sign Up!")
                        .foregroundColor(Color.white)
                        .font(.custom("RobotoSlab-Bold", size: 25.0))
                        .padding(.all, 10.0)
                        .padding(.horizontal, 90.0)
                        .background(.black).cornerRadius(25.0)
                }
                Button {
                    viewRouter.currentPage = .Login
                } label: {
                    Text("Already Have An Account? Login!")
                        .foregroundColor(Color.white)
                        .font(.custom("RobotoSlab-Bold", size: 20.0))
                        .padding(.all, 10.0)
                        .padding(.horizontal, 60.0)
                }
                
                Spacer()
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(viewRouter: ViewRouter(), appViewModel: AppViewModel())
    }
}
