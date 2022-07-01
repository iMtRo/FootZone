import SwiftUI


struct TabBarView: View {
    
    @State var info = false
    
    var body: some View {
        TabView{
            HomeView()
                .tabItem{
                    Label("Maydonlar", systemImage: "house")
                }
            
            ListView()
                .badge(info ? "" : nil)
                .tabItem{
                    Label("Jadval", systemImage: "list.bullet.rectangle.portrait")
                }
            
            AccountView()
                .tabItem{
                    Label("Akkaunt", systemImage: "person")
                }
        }.accentColor(.black)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
