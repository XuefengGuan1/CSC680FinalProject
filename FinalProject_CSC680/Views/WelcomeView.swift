import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager:
        LocationManager
    
    var body: some View {
        VStack{
            
        
        VStack(spacing:20){
            Text("Welcome to the Weather App")
                .bold().font(.title)
            Text("Enter your location to continue")
                .padding()
        }
        .multilineTextAlignment(.center)
        .padding()
        
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
