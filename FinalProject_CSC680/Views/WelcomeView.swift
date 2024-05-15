import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager:
    LocationManager
    @State private var searchText = ""
    
    
    var body: some View {
            
            
            VStack{
                VStack(spacing:20){
                    Text("Welcome to the Weather App")
                        .bold().font(.title)
                    Text("Share or enter a location to continue")
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
                
                TextField("Enter the city name", text: $searchText)
                    .padding()
                    .background(Color(.systemGray5))
                    .cornerRadius(8)
                    .padding(.horizontal)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
