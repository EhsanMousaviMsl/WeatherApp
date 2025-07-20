import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(topColer: isNight ? .black : .blue,
                          bottomColor: isNight ? .gray : Color("lightBlue"))
            
            VStack {
                CityTextView(cityName: "Moscow, Ru")
                MainWeatherStatus(wheatherSign: isNight ? "moon.fill" : "cloud.sun.fill", temprature: isNight ? 18 : 22)
                HStack(){
                    WeatherOfDay(DaysOfWeek: "MUN", NameOfImage: "cloud.sun.fill", temprature: 24)
                    WeatherOfDay(DaysOfWeek: "TUE", NameOfImage: "sun.max.fill", temprature: 28)
                    WeatherOfDay(DaysOfWeek: "WEN", NameOfImage: "cloud.rain.fill", temprature: 20)
                    WeatherOfDay(DaysOfWeek: "THU", NameOfImage: "cloud.rain.fill", temprature: 19)
                    WeatherOfDay(DaysOfWeek: "FRI", NameOfImage: "cloud.snow.fill", temprature: 1)


                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time!",
                                  buttonColor: .white, textColor: .blue)
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

struct BackgroundView : View {
    var topColer : Color
    var bottomColor : Color
    var body : some View {
        LinearGradient(colors: [topColer, bottomColor], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName : String
    var body: some View {
        Text(cityName)
            .font(.system(size:32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}

struct MainWeatherStatus: View {
    var wheatherSign : String
    var temprature : Int
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: wheatherSign)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temprature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(.white)
        }
        .padding(.bottom, 40)
    }
}


struct WeatherButton : View {
    var title : String
    var buttonColor: Color
    var textColor : Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(buttonColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(30)
    }
}
