//
//  SwiftUIView.swift
//  Demo
//
//  Created by Bhargavi on 21/11/19.
//  Copyright © 2019 Amrutha. All rights reserved.
//

import SwiftUI
struct DetailView1: View {
    var body: some View {
        Text("This is the detail view")
         }
}

struct ContenetView : View {
    @State  private var userName: String = ""
    @State  private var password: String = ""
    @State  private var showAlert = false
    @State  private var navigation = false

    var body: some View {
        NavigationView {
            VStack(alignment: HorizontalAlignment.center, spacing: 10)  {
         
            Image("Login")
            .resizable()
            .scaledToFit()
             .frame(width: 320.0,height:300)
                
            TextField("Enter UserName", text: $userName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(10.0).foregroundColor(.black)
               
            SecureField("Enter Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(10.0)
                NavigationLink(destination: DetailView1(), isActive: $navigation) {

                  Text("")
                }
                Button(action: {
                    if((self.userName.isEmpty == true) || (self.password.isEmpty == true)){
                        self.showAlert = true
                    }
                    else{
                        self.navigation = true
                    }
                    }) {
              Text("Login")

              }.alert(isPresented: $showAlert){
                Alert(title: Text("Important message"), message: Text("Please fill the Details"), dismissButton: .default(Text("Got it!")))

                  }
    
        }.frame(width:400)

        }
       
}
   
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ContenetView()
    }
}
