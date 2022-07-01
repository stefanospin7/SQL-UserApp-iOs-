//
//  EditUserView.swift
//  UserSql
//
//  Created by Stefano  on 01/07/22.
//

import SwiftUI

struct EditUserView: View {
     
    // id receiving of user from previous view
    @Binding var id: Int64
     
    // variables to store value from input fields
    @State var name: String = ""
    @State var email: String = ""
    @State var age: String = ""
    @State var note: String = ""

     
    // to go back to previous view
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
     
    var body: some View {
        ScrollView {
            VStack {
                // create name field
                TextField("Enter name", text: $name)
                    .extensionTextFieldView(roundedCornes: 6, startColor: .white, endColor: .blue)
                        .foregroundColor(.black)
                 
                // create email field
                TextField("Enter email", text: $email)
                    .extensionTextFieldView(roundedCornes: 6, startColor: .white, endColor: .blue)
                        .foregroundColor(.black)
                 
                // create age field, number pad
                TextField("Enter age", text: $age)
                    .extensionTextFieldView(roundedCornes: 6, startColor: .white, endColor: .blue)
                        .foregroundColor(.black)
                TextField("Enter note", text: $note)
                    .extensionTextFieldView(roundedCornes: 6, startColor: .white, endColor: .blue)
                        .foregroundColor(.black)
                
                
                // button to update user
                Button(action: {
                    // call function to update row in sqlite database
                    DB_Manager().updateUser(idValue: self.id, nameValue: self.name, emailValue: self.email, ageValue: Int64(self.age) ?? 0,noteValue:self.note)
     
                    // go back to home page
                    self.mode.wrappedValue.dismiss()
                }, label: {
                    Text("Edit User")
                })
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
            }.padding()
     
            // populate user's data in fields when view loaded
            .onAppear(perform: {
                 
                // get data from database
                let userModel: UserModel = DB_Manager().getUser(idValue: self.id)
                 
                // populate in text fields
                self.name = userModel.name
                self.email = userModel.email
                self.age = String(userModel.age)
                self.note = String(userModel.note)
        })
        }
    }
}
 
struct EditUserView_Previews: PreviewProvider {
     
    // when using @Binding, do this in preview provider
    @State static var id: Int64 = 0
     
    static var previews: some View {
        EditUserView(id: $id)
    }
}
