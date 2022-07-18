import SwiftUI

struct SignUpView: View {
    
    @State private var name = ""
    @State private var isName = false
    @State private var sureName = ""
    @State private var isSureName = false
    @State private var phoneNumber = ""
    @State private var isNumber = false
    @State private var password = ""
    @State private var isPassword = false
    @State private var password2 = ""
    @State private var isPassword2 = false
    @State var text = ""
    
    @State private var selectedCategory: Category = Category.user
    @State var userField = false
    
    var body: some View {
        VStack(spacing: UIScene.height > 750 ? 20 : 10){
            
            UserAdminMenu(userField: false)
                .padding(.top)
            
            MyTextFeild(text: $name, isEditingName: isName, title: "Ism")
            
            MyTextFeild(text: $sureName, isEditingName: isSureName, title: "Familiya")
            
            MyTextFeild(text: $phoneNumber, isEditingName: isNumber, title: "Telefon raqam")
            
            MyTextFeild(text: $password, isEditingName: isPassword, title: "Parol")
            
            MyTextFeild(text: $password2, isEditingName: isPassword2, title: "Parol qaytaring")
            
            Button{
                
            }label: {
                Text("Ro'yxatdan o'tish")
                    .fontWeight(.semibold)
                    .font(.system(size: 15))
                    .foregroundColor(.black.opacity(0.5))
                    .padding(UIScene.height > 750 ? 15 : 10)
                    .background(.gray.opacity(0.4))
                    .cornerRadius(30)
            }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal, 10)
            
            VStack{
                Spacer()
                Group{
                    Text("Ro'yxatdan o'tish orqali siz bizning")
                        .foregroundColor(.black)
                    Text("shartlarimizga va maxfiylik siyosatimizga")
                        .foregroundColor(.blue)
                    Text("rozilik bildirasiz!")
                        .foregroundColor(.black)
                }.fixedSize()
                Spacer()
            }
            
            LogInTabBarView(text: "Akkauntingiz bormi ?", title: "Kiring")
            
        }.navigationBarTitle("Ro'yxatdan o'tish", displayMode: .inline)
        
    }
}
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
