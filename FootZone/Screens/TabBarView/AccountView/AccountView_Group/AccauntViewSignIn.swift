import SwiftUI

struct AccauntViewSignIn: View {
    
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    @State private var showActionSheet = false
    
    var body: some View {
        ZStack(alignment: .bottomLeading){
            VStack(spacing: UIScene.height > 750 ? 70 : 50){
                
                ZStack(alignment: .topTrailing){
                    Image("image")
                        .resizable()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                    Button(action: {}, label: {
                       Image(systemName: "ellipsis")
                            .foregroundColor(.white)
                            .font(Font.title3.weight(.black))
                   }).padding(UIScene.height > 750 ? 25 : 20)
                    
                }
                
                VStack(alignment: .leading, spacing: 10){
                    // User Name
                    HStack{
                        Text("Maxmudov Ilyos")
                            .font(.system(size: UIScene.height > 750 ? 30 : 25))
                            .fontWeight(.medium)
                        
                        Spacer()
                        
                        Button(action: {}, label: {
                            Image(systemName: "pencil")
                                .font(Font.title3.weight(.bold))
                                .foregroundColor(.blue)
                                .padding(.horizontal)
                        })
                    }.padding(.horizontal, UIScene.height > 750 ? 15 : 10)
                    
                    // User Phone Number
                    HStack{
                        Image(systemName: "phone")
                            .font(Font.title3.weight(.bold))
                            .padding(.trailing)
                        Text("+998 90 000 00 00")
                            .font(.system(size: UIScene.height > 750 ? 18 : 13))
                            .fontWeight(.medium)
                    }.padding(.horizontal, UIScene.height > 750 ? 15 : 10)
                }
            }
            
            ZStack{
                Circle()
                    .foregroundColor(.white.opacity(0.6))
                    .frame(maxWidth: UIScene.height > 750 ? 150 : 120, maxHeight: UIScene.height > 750 ? 150 : 120)
                    .overlay(RoundedRectangle(cornerRadius: 100).stroke(.white, lineWidth: 3))
                
                ZStack(alignment: .bottomTrailing){
                    
                    Group{
                        if selectedImage != nil{
                            Image(uiImage: selectedImage!)
                                .resizable()
                        } else {
                            Image(systemName: "person")
                                .resizable()
                                .frame(width: 100, height: 100)
                        }
                    }
                        .clipShape(Circle())
                        .frame(width: UIScene.height > 750 ? 150 : 120, height: UIScene.height > 750 ? 150 : 120)
                    
                    Button(action: {
                        showActionSheet = true
                    }, label: {
                        ZStack{
                            Circle()
                                .foregroundColor(.gray)
                            Image(systemName: selectedImage != nil ? "pencil.circle" : "plus.circle")
                                .resizable()
                                .foregroundColor(.white)
                        }.frame(width: 30, height: 30).padding(2)
                    })
                }
            }
            .actionSheet(isPresented: $showActionSheet){
                ActionSheet(
                    title: Text("Actions"),
                    buttons: [
                        .cancel { print(self.showActionSheet) },
                        .default(Text("Pick Photo")){
                            self.sourceType = .photoLibrary
                            self.isImagePickerDisplay.toggle()
                            selectedImage = nil
                        },
                        .default(Text("Take Photo")){
                            self.sourceType = .camera
                            self.isImagePickerDisplay.toggle()
                            selectedImage = nil
                        },
                    ]
                )
            }
            .padding(.bottom, UIScene.height > 750 ? 75 : 70).padding(.leading, UIScene.height > 750 ? 30 : 20)
            .sheet(isPresented: self.$isImagePickerDisplay){
                    ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
            }
        }
    }
}

struct AccauntViewSignIn_Previews: PreviewProvider {
    static var previews: some View {
        AccauntViewSignIn()
    }
}
