
import SwiftUI

struct ListView: View {
    
    @State var isTrue = false
    
    var body: some View {
        NavigationView{
            VStack{
                
                if isTrue {
                    ListViewSignIn()
                } else {
                    ListViewSignOut()
                }
                
            }.navigationBarTitle("Maydonlar")
        }.listStyle(PlainListStyle())
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
