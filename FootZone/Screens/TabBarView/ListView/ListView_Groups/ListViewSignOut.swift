import SwiftUI

struct ListViewSignOut: View {
    
    var body: some View {
        
        VStack{
            Text("Maydonlar jadvalini ko'rish uchun")
                .fontWeight(.medium)
                .font(.system(size: 18))
            Text("akkauntga kiring")
                .fontWeight(.medium)
                .font(.system(size: 18))
            
            
            NavigationLink{
                SignInView()
            } label: {
                Text("Kirish")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(.blue)
                    .cornerRadius(25)
            }
        }
        
    }
}

struct ListViewSignOut_Previews: PreviewProvider {
    static var previews: some View {
        ListViewSignOut()
    }
}
