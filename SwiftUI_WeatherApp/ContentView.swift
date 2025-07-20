import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    private let dailyForcast : [DailyWeather] = [
        DailyWeather(day: "TUE", icon: "cloud.sun.fill", temprature: 24),
        DailyWeather(day: "WEN", icon: "sun.max.fill", temprature: 28),
        DailyWeather(day: "THU", icon: "cloud.rain.fill", temprature: 20),
        DailyWeather(day: "FRI", icon: "cloud.rain.fill", temprature: 12),
        DailyWeather(day: "SAT", icon: "cloud.snow.fill", temprature: 1)
     ]
    
    var body: some View {
        ZStack {
            BackgroundView(topColer: isNight ? .black : .blue,
                          bottomColor: isNight ? .gray : Color("lightBlue"))
            
            VStack {
                CityTextView(cityName: "Moscow, Ru")
                MainWeatherStatus(wheatherSign: isNight ? "moon.fill" : "cloud.sun.fill", temprature: isNight ? 18 : 22)
                HStack(){
                    ForEach(dailyForcast, id: \.day) { day in
                        WeatherOfDay(DaysOfWeek: day.day, NameOfImage: day.icon, temprature: day.temprature)
                        
                    }


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

struct DailyWeather {
    var day : String
    var icon : String
    var temprature : Int
}
