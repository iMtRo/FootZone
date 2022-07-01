import SwiftUI

struct AccountView: View {
    @State var isAccount = true
    
    var body: some View {
        VStack{
            VStack(alignment: .center){
                Spacer()
                if isAccount {
                    AccauntViewSignIn()
                } else {
                    ListViewSignOut()
                }
                Spacer()
            }
            
            
            // Gray Line
            Rectangle()
                .foregroundColor(.gray.opacity(0.2))
                .frame(width: .infinity, height: 10)
            
            
            // Setting View
            VStack(alignment: .leading){
                // View Title
                HStack{
                    Text("Sozlamalar")
                        .fontWeight(.bold)
                        .font(.system(size: UIScene.height > 750 ? 20 : 15))
                    Spacer()
                }.padding(.horizontal, UIScene.height > 750 ? 15 : 10)
                
                // Setting Notification Button
                Button(action: {}, label: {
                    HStack{
                        Image(systemName: "bell")
                            .font(Font.title2.weight(.bold))
                            .foregroundColor(.black)
                            .padding(UIScene.height > 750 ? 15 : 10)
                        
                        VStack(alignment: .leading, spacing: 5){
                            Text("Bildirishnomalar")
                                .foregroundColor(.black)
                                .fontWeight(.medium)
                                .font(.system(size: UIScene.height > 750 ? 18 : 15))
                            
                            Text("Bildirishnomalar sozlamalari")
                                .foregroundColor(.black)
                                .fontWeight(.regular)
                                .font(.system(size: UIScene.height > 750 ? 15 : 13))
                        }
                    }
                })
                
                // Setting Language Button
                Button(action: {}, label: {
                    HStack{
                        Image(systemName: "globe")
                            .font(Font.title2.weight(.bold))
                            .foregroundColor(.black)
                            .padding(UIScene.height > 750 ? 15 : 10)
                        
                        VStack(alignment: .leading, spacing: 5){
                            Text("Til")
                                .foregroundColor(.black)
                                .fontWeight(.medium)
                                .font(.system(size: UIScene.height > 750 ? 18 : 15))
                            
                            Text("O'zbekcha")
                                .foregroundColor(.black)
                                .fontWeight(.regular)
                                .font(.system(size: UIScene.height > 750 ? 15 : 13))
                        }
                    }
                })

            }
            .padding(.vertical, UIScene.height > 750 ? 15 : 8)
            
            
            // Gray Line
            Rectangle()
                .foregroundColor(.gray.opacity(0.2))
                .frame(maxWidth: .infinity  , maxHeight: 10)
            
            
            // Info View
            VStack(alignment: .leading){
                // View Title
                HStack{
                    Text("Ilova haqida")
                        .fontWeight(.bold)
                        .font(.system(size: UIScene.height > 750 ? 20 : 15))
                    Spacer()
                }.padding(.horizontal, UIScene.height > 750 ? 15 : 10)
                
                // Setting Notification Label
                HStack{
                    Image(systemName: "info.circle")
                        .font(Font.title2.weight(.bold))
                        .foregroundColor(.black)
                        .padding(15)
                    
                    VStack(alignment: .leading, spacing: 5){
                        Text("Ilova versiyasi")
                            .foregroundColor(.black)
                            .fontWeight(.medium)
                            .font(.system(size: UIScene.height > 750 ? 18 : 15))
                        
                        Text("1.0.2")
                            .foregroundColor(.black)
                            .fontWeight(.regular)
                            .font(.system(size: UIScene.height > 750 ? 15 : 13))
                    }
                }

            }
            .padding(.vertical, UIScene.height > 750 ? 15 : 10)
            
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
