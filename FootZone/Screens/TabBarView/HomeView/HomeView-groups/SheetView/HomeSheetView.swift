import SwiftUI

struct HomeSheetView : View {
    
    @Binding  var isShowing: Bool
    @State var text = ""
    @State private var curHeight: CGFloat = UIScene.height > 750 ? 350 : 150
    @State private var isDragging = false
    let minHeight: CGFloat = UIScene.height > 750 ? 200 : 150
    let maxHeight: CGFloat = UIScene.height > 750 ? 450 : 350
    
    
    var body: some View {
        ZStack(alignment: .bottom){
            mainView
                .transition(.move(edge: .bottom))
                .gesture(dragGesture)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
    }
    
    
    // Sheet Menu
    var mainView: some View{
        VStack(alignment: .trailing){
            // Locatsion Button
            ZStack{
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white)
                
                Button{} label: {
                    Image(systemName: "location.circle")
                        .font(Font.title3.weight(.bold))
                }
            }.padding()
            
            VStack{
                Capsule()
                    .frame(width: 40, height: 6)
                    .padding(.vertical ,UIScene.height > 750 ? 10 : 5)
                    .foregroundColor(.gray.opacity(0.5))
                ZStack{
                    ScrollView(showsIndicators: false){
                        VStack{
                            // Look Text Field
                            HStack{
                                Image(systemName: "magnifyingglass")
                                    .font(Font.system(size: UIScene.height > 750 ? 20 : 18).weight(.semibold))
                                
                                TextField("", text: $text)
                                    .placeholder(when: text.isEmpty) {
                                        Text("Maydon nomi")
                                            .foregroundColor(.black.opacity(0.7))
                                            .font(.system(size: UIScene.height > 750 ? 18 : 15))
                                    }
                                
                            }
                                .padding(UIScene.height > 750 ? 20 : 15)
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray.opacity(0.6), lineWidth: 2))
                                .padding(UIScene.height > 750 ? 15 : 10)
                            
                            // Sheet Bar Items
                            VStack(alignment: .leading, spacing: 15){
                                HStack(spacing: 10){
                                    VStack(alignment: .leading, spacing: 10){
                                        Button{} label: {
                                            Image(systemName: "paperplane")
                                                .font(Font.title2.weight(.regular))
                                            
                                            Text("Yaqin atrofdagi maydonlar")
                                                .fontWeight(.semibold)
                                                .font(.system(size: UIScene.height > 750 ? 18 : 13))
                                        }.padding(.horizontal)
                                    }
                                        .frame(width: UIScene.width/2 - 20, height: UIScene.height/9, alignment: .leading)
                                        .background(Color.gray.opacity(0.1))
                                    
                                    
                                    VStack(alignment: .leading, spacing: 10){
                                        Button{}label: {
                                            Image(systemName: "bookmark")
                                                .font(Font.title2.weight(.regular))
                                            
                                            Text("Tanlangan maydonlar")
                                                .fontWeight(.semibold)
                                                .font(.system(size: UIScene.height > 750 ? 18 : 13))
                                        }.padding(.horizontal)
                                    }
                                    .frame(width: UIScene.width/2 - 20, height: UIScene.height/9, alignment: .leading)
                                    .background(Color.gray.opacity(0.1))
                                }
                                
                                VStack(alignment: .leading, spacing: 10){
                                    Button{}label: {
                                        Image(systemName: "clock.arrow.2.circlepath")
                                            .font(Font.title2.weight(.regular))
                                        
                                        Text("Tanlangan maydonlar")
                                            .fontWeight(.semibold)
                                            .font(.system(size: UIScene.height > 750 ? 18 : 13))
                                    }.padding(.horizontal)
                                    
                                }
                                    .frame(width: UIScene.width/2 - 20, height: UIScene.height/9, alignment: .leading)
                                    .background(Color.gray.opacity(0.1))
                            }
                        }
                        .multilineTextAlignment(.trailing)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.horizontal, 10)
                    }
                }
                .frame(maxHeight: .infinity)
            }
                .frame(height: curHeight)
                .frame(maxWidth: .infinity)
                .background( ZStack{
                    RoundedRectangle(cornerRadius: 30)
                    Rectangle().frame(height: curHeight/2)
                }.foregroundColor(.white))
                .animation(isDragging ? nil : .easeInOut(duration: 0.45))
        }
    }
    
    // Sheet Drag Gesture
    @State private var prevDragTranslation = CGSize.zero
    var dragGesture: some Gesture{
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged{ val in
                if !isDragging{
                    isDragging = true
                }
                let dragAmount = val.translation.height - prevDragTranslation.height
                if curHeight > maxHeight || curHeight < minHeight {
                    curHeight -= dragAmount / 15
                } else {
                    curHeight -= dragAmount
                }
                prevDragTranslation = val.translation
            }
            .onEnded{ val in
                prevDragTranslation = .zero
                isDragging = false
                if curHeight > maxHeight{
                    curHeight = maxHeight
                } else if curHeight < minHeight{
                    curHeight = minHeight
                }
            }
    }
    
}

struct ModalView_Previews: PreviewProvider{
    static var previews: some View{
        HomeSheetView(isShowing: .constant(true))
    }
}


// Text Fiels Placeholder
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
