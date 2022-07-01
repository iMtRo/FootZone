import SwiftUI

struct SignUpView: View {
    @State private var name = ""
    @State private var isEditingName = false
    var body: some View {
        VStack(alignment: .leading){
            Text("Name")
                .scaleEffect((self.name == "" && self.isEditingName == false) ? 1 : 1)
                .offset(y: (self.name == "" && self.isEditingName == false ) ? 50 : 20)
                .animation(.spring())
                .padding(.horizontal)
            
            TextField("", text: $name )
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray.opacity(0.6), lineWidth: 2))
        }
            .padding()
            .onTapGesture {
                self.isEditingName.toggle()
                if(self.isEditingName == false){
                    UIApplication.shared.endEditing()
                }
            }
    }
}
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

//.overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray.opacity(0.6), lineWidth: 2))
