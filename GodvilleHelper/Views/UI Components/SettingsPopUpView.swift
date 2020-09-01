import SwiftUI

struct SettingsPopUpView: View {
    @ObservedObject var heroHandler: GodvilleDataHandler
    @ObservedObject var god: God
    
    @Binding var popUpShown: Bool
    
    @State var godname: String = ""
    @State var token: String = ""
    
    var updateStatus: () -> ()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                
                VStack(spacing: 0) {
                    Group {
                        Spacer()
                            .frame(height: 10)
                        
                        HStack {
                            Text("Настройка профиля")
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        
                        Spacer()
                            .frame(height: 15)
                    }
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Бог")
                                .font(.headline)
                                .multilineTextAlignment(.leading)
                            
                            Text("Токен")
                                .font(.headline)
                                .multilineTextAlignment(.leading)
                            
                        }
                        
                        VStack(spacing: 10) {
                            TextField("Имя бога", text: $godname)
                            TextField("Можно оставить пустым", text: $token)
                            
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                        .frame(height: 10)
                    
                    Button("Получить токен") {
                        NSWorkspace.shared.open(URL(string: "https://godville.net/user/profile")!)
                    }
                    
                    Spacer()
                        .frame(height: 8)
                    
                    HStack {
                        Text("Без токена будет отображатся лишь часть параметров вашего подопечного.\nЕсли вы ввели токен, но все равно не все данные отображаются, получите новый на сайте с игрой.")
                            .font(.caption)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                        .frame(height: 10)
                    
                    HStack {
                        Button("Cохранить") {
                            god.save(godname: godname, token: token)
                            heroHandler.getGodInfo(godname: godname, token: token, completeon: updateStatus)

                            withAnimation {
                                popUpShown.toggle()
                            }
                        }
                        
                        Button("Отменить") {
                            withAnimation {
                                popUpShown.toggle()
                            }
                        }
                    }
                    
                    Spacer()
                        .frame(height: 10)
                }
                .frame(width: geometry.size.width - 40, alignment: .center)
                .background(Color("foregroundColor"))
                .cornerRadius(15)
                
                Spacer()
            }
        }
        .background(Color("backgroundColor").opacity(0.6))
        .frame(minWidth: 500, idealWidth: 500, maxWidth: 500, minHeight: 500, idealHeight: 1200, maxHeight: .infinity)
        .onAppear(perform: {
            
            godname = god.godname
            token = god.token
        })
    }
}

