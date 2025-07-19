import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea(.all)
            
            VStack {
                Text("Moscow, RU")
                    .font(.system(size:32, weight: .medium, design: .default))
                    .foregroundStyle(.white)
                    .padding()
                VStack(spacing: 8) {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    
                    Text("22°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundStyle(.white)
                }
                Spacer()
                HStack(){
                    WeatherOfDay(DaysOfWeek: "MUN", NameOfImage: "cloud.sun.fill", temprature: 24)
                    WeatherOfDay(DaysOfWeek: "TUE", NameOfImage: "sun.max.fill", temprature: 28)
                    WeatherOfDay(DaysOfWeek: "WEN", NameOfImage: "cloud.rain.fill", temprature: 20)
                    WeatherOfDay(DaysOfWeek: "THU", NameOfImage: "cloud.rain.fill", temprature: 19)
                    WeatherOfDay(DaysOfWeek: "FRI", NameOfImage: "cloud.snow.fill", temprature: 1)


                }
                
                Spacer()
            }
        }
        
    }
}


#Preview {
    ContentView()
}

struct WeatherOfDay: View {
    
    var DaysOfWeek : String
    var NameOfImage : String
    var temprature : Int
    
    var body: some View {
        VStack {
            Text(DaysOfWeek)
                .font(.system(size:16, weight: .medium, design: .default))
                .foregroundStyle(.white)
                .padding()
            VStack(spacing: 8) {
                Image(systemName: NameOfImage)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                
                Text("\(temprature)°")
                    .font(.system(size: 28, weight: .medium))
                    .foregroundStyle(.white)
            }
        }
    }
}
