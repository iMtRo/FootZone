import Foundation
import SwiftUI


enum Category: String, CaseIterable, Identifiable {
    var id:String { self.rawValue}
    case user = "Oddiy foydalanuvchi"
    case admin = "Maydon egasi"
}

