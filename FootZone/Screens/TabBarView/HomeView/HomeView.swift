import SwiftUI

struct HomeView: View {
    
    init(){
        UITabBar.appearance().barTintColor = UIColor.white
    }
    
    var body: some View {
        ZStack(alignment: .top){
            
            MapView()
            
            // Navigation Bar
            HStack{
                Spacer()
                VStack{
                    Text("Sizning manzilingiz")
                        .font(.system(size: 18))
                    
                    Text("Toshkent")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                }.padding(.leading, 60)
                
                Spacer()
                
                // Navigation Bar Notification Button
                ZStack{
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                    
                    Button{} label: {
                    Image(systemName: "bell")
                        .font(Font.title3.weight(.bold))
                }
                }.padding()
            }
                .frame(maxWidth: .infinity, alignment: .top)
            
            HomeSheetView(isShowing: .constant(true))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
