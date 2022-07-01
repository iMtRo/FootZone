import SwiftUI

struct ListViewSignIn: View {
    
    @State var isPlayed = true
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    isPlayed = true
                }, label: {
                    VStack{
                        Text("O'ynaladi")
                            .font(.system(size: 18))
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .padding(10)
                            .frame(width: UIScene.width/2 - 15)
                        
                        Rectangle()
                            .foregroundColor(isPlayed ? .blue : .gray)
                            .frame(width: UIScene.width/2, height: isPlayed ? 3 : 1)
                    }
                })
                
                Spacer()
                
                Button(action: {
                    isPlayed = false
                }, label: {
                    VStack{
                        Text("O'ynalgan")
                            .font(.system(size: 18))
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .padding(10)
                            .frame(width: UIScene.width/2 - 10)
                        
                        Rectangle()
                            .foregroundColor(isPlayed ? .gray : .blue)
                            .frame(width: UIScene.width/2, height: isPlayed ? 1 : 3)
                    }
                })
            }.padding()
            
            ScrollView{
                
            }
        }
    }
}

struct ListViewSignIn_Previews: PreviewProvider {
    static var previews: some View {
        ListViewSignIn()
    }
}
