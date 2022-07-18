import Foundation
import SwiftUI
import iPhoneNumberField

// User and Admin Pekir
struct UserAdminMenu: View {
    
    @State private var selectedCategory: Category = Category.user
    @State var userField = false
    
    var body: some View {
        
        ZStack(alignment: .topLeading){
            Picker("Category", selection: $selectedCategory){
                ForEach(Category.allCases) { category in
                    Text(category.rawValue)
                        .tag(category)
                }
            }.pickerStyle(.automatic)
                .onTapGesture {
                    userField.toggle()
                }
                .padding(.vertical, UIScene.height > 750 ? 10 : 5)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal,20)
                .overlay(RoundedRectangle(cornerRadius: 7).stroke(userField ? Color.blue : Color.gray.opacity(0.5), lineWidth: 1))
            
            Text("Foydalanuvchi turi")
                .padding(.horizontal, 5)
                .background(.white)
                .opacity(1)
                .offset(y: -10)
                .padding(.horizontal)
        }.padding(.horizontal, 10)
        
    }
}

// TextField
struct MyTextFeild:View{

    @Binding var text: String
    @State var isEditingName = false
    let title: String
    
    var body: some View {
        ZStack(alignment: .topLeading){
            TextField("",text: $text)
                .textFieldStyle(CaptionTextFieldStyle())
            
            VStack(alignment: .leading) {
                Text(title)
                    .padding(.horizontal, 5)
                    .background(.white)
                    .opacity(1)
                    .offset(y: -10)
                    .padding(.horizontal)
                    .scaleEffect((self.text == "" && self.isEditingName == false) ? 1 : 1)
                    .offset(y: (self.text == "" && self.isEditingName == false ) ? (UIScene.height > 750 ? 25 : 20) : 0)
                    .animation(.spring())
            }
        }.padding(.horizontal,10)
        .onTapGesture {
             self.isEditingName.toggle()
             if(self.isEditingName == false){
                 UIApplication.shared.endEditing()
             }
         }
    }
}


// TextField Style
struct CaptionTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .padding(UIScene.height > 750 ? 15 : 10)
            .overlay(RoundedRectangle(cornerRadius: 7).stroke(Color.gray.opacity(0.5), lineWidth: 1))
            .foregroundColor(.black)
    }
}


// SignIn and SignUp views TabBAr
struct LogInTabBarView:View{

    let text: String
    let title: String
    
    var body: some View {
        VStack{
            Rectangle()
                .foregroundColor(.gray.opacity(0.6))
                .frame(maxWidth: .infinity, maxHeight: 1)
            
            HStack{
                Text(text)
                    .fontWeight(.regular)
                Text(title)
                    .foregroundColor(.blue)
                    .padding(.leading, 3)
            }.padding(.vertical,10)
            .fixedSize()
        }.frame(maxHeight: 60, alignment: .center)
    }
    
}
