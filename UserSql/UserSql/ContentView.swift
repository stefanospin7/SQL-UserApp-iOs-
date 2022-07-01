//
//  ContentView.swift
//  UserSql
//
//  Created by Stefano  on 01/07/22.
//

import SwiftUI

struct ContentView: View {
    
    // create variables to store user input values
    @State var name: String = ""
    @State var email: String = ""
    @State var age: String = ""
    @State var note: String = ""
    
    //Default edit call
    @State static var id: Int64 = 0

    // to go back on the home screen when the user is added
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
     
    var body: some View {
         
        NavigationView {
            VStack {
                
                Text("Subsribe to this useless app")
                    .foregroundColor(Color.blue)
                    .font(Font.title2)
                    .fontWeight(.heavy)
              
                
                // create name field
                
                TextField("Enter name", text: $name).extensionTextFieldView(roundedCornes: 6, startColor: .white, endColor: .blue)
                    .foregroundColor(.black)
               
                 
                // create email field
                TextField("Enter email", text: $email).extensionTextFieldView(roundedCornes: 6, startColor: .white, endColor: .blue)
                    .foregroundColor(.black)
                 
                 
                // create age field, number pad
                TextField("Enter age", text: $age).extensionTextFieldView(roundedCornes: 6, startColor: .white, endColor: .blue)
                    .foregroundColor(.black)
                
                
                
                Text("Add a note about yourself")
                    .foregroundColor(Color.blue)
                    .font(Font.title3)
                    .fontWeight(.heavy)
         
                
                TextEditor(text: $note)
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(5)
                    .keyboardType(.numberPad)
                    .disableAutocorrection(true)
                
                NavigationLink("Edit user", destination: EditUserView(id: ContentView.$id))
                 
                // button to add a user
                Button(action: {
                    // call function to add row in sqlite database
                    DB_Manager().addUser(nameValue: self.name, emailValue: self.email, ageValue: Int64(self.age) ?? 0, noteValue: self.note)
                     
                    // go back to home page
                    self.mode.wrappedValue.dismiss()
                }, label: {
                    Text("Add User")
                })
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
            }.padding()
        }
   
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



