import SwiftUI

struct WeatherRow: View {
    var name: String
    var value: String
    
    var body: some View {
        HStack(spacing:20){
            Image("Temp")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .padding()
                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.888))
                .cornerRadius(50)
            VStack(alignment: .leading, spacing: 8){
                Text(name)
                    .font(.caption)
                
                Text(value)
                    .bold()
                    .font(.title)
                    .lineLimit(1)
            }
        }
    }
}

struct WeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRow(name:"Feelslike", value:"8°C")
        
    }
}
