import SwiftUI
import MapKit

struct MapView: View {
    
    let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 41.3138689, longitude: 69.2466109), latitudinalMeters: 1000, longitudinalMeters: 1000)
    
    var body: some View {
        Map(coordinateRegion: .constant(region))
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
