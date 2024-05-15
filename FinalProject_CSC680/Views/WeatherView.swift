import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    @State var isModal: Bool = false

    var body: some View {
        ZStack(alignment: .leading){
            VStack(){
                VStack(alignment: .leading, spacing: 5){
                    Button("Go Back") {
                                self.isModal = true
                            }.sheet(isPresented: $isModal, content: {
                                ContentView()
                            })
                    Text(weather.name)
                        .bold().font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))").fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack{
                    HStack{
                        VStack(spacing:20){
                            Image("sunny")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                            
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feels_like.roundDouble()+"°C")
                            .font(.system(size:50))
                            .fontWeight(.bold)
                            .padding()
                            .lineLimit(1)
                    }
                    
                    Spacer()
                        .frame(height:80)
                    
                    AsyncImage(url: URL(string: "https://cdn-icons-png.flaticon.com/512/8354/8354127.png")) { image in image
                            .resizable()
                            .aspectRatio(contentMode:.fit)
                            .frame(width:350)
                    }placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            VStack{
                Spacer()
                
                VStack(alignment: .leading, spacing: 20){
                    Text("Weather now")
                        .bold().padding(.bottom)
                    
                    HStack{
                        WeatherRow(name:"Min Temp", value:(weather.main.tempMin.roundDouble()) + "°C")
                        Spacer()
                        WeatherRow(name:"Max Temp", value:(weather.main.tempMax.roundDouble()) + "°C")
                    }
                }
                .frame(maxWidth: .infinity, alignment:.leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.324, saturation: 0.486, brightness: 0.836))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.324, saturation: 0.486, brightness: 0.836))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
            .previewInterfaceOrientation(.portrait)
    }
}
