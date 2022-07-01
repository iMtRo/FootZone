import SwiftUI

@main
struct FootZoneApp: App {
    var body: some Scene {
        WindowGroup {
            TabBarView()
        }
    }
}


extension UIScene {
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
}
