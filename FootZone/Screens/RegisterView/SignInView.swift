import SwiftUI
import iPhoneNumberField

struct SignInView: View {
    
    @State private var phoneNumber = "+998"
    @State private var isNumber = false
    
    var body: some View {
        VStack(spacing: 35){
            
            ZStack(alignment: .topLeading){
                iPhoneNumberField( nil , text: $phoneNumber)
                    .flagHidden(false)
                    .prefixHidden(false)
                    .font(UIFont(size: 20, weight: .medium))
                    .maximumDigits(9)
                    .clearButtonMode(.whileEditing)
                    .padding(20)
                    .overlay(RoundedRectangle(cornerRadius: 7).stroke(Color.gray.opacity(0.5), lineWidth: 1))
                
                VStack(alignment: .leading) {
                    Text("Telefon raqam")
                        .padding(.horizontal, 5)
                        .background(.white)
                        .opacity(1)
                        .offset(y: -10)
                        .padding(.horizontal)
                        .scaleEffect(1)
                        .offset(y: 0)
                }
            }.padding(.horizontal,10)
            
            HStack{
                NavigationLink{}label: {
                    Text("Parolingizni unutdingizmi ?")
                        .foregroundColor(.blue)
                } .padding(.horizontal,10)
                
                Spacer()
                
                Button{}label: {
                    Text("Kirish")
                        .fontWeight(.semibold)
                        .font(.system(size: 15))
                        .padding(.horizontal,20)
                        .foregroundColor(phoneNumber.count == 17 ? .white : .black.opacity(0.5))
                        .padding(UIScene.height > 750 ? 15 : 10)
                        .background(phoneNumber.count == 17 ? .blue : .gray.opacity(0.4))
                        .cornerRadius(30)
                }.padding(.horizontal, 10)
            }
            
            Spacer()
            
            LogInTabBarView(text: "Akkauntingiz yo'qmi ?", title: "Ro'yxatdan o'ting")
            
        }.navigationBarTitle("Kirish", displayMode: .inline)
            .padding(.top, UIScene.height > 750 ? 30 : 20)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}


