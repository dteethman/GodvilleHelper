import SwiftUI
import Combine

class God: ObservableObject {
    var didChange = PassthroughSubject<Void, Never>()
    
    var godname: String = "" { didSet { didChange.send() } }
    var token: String = "" { didSet { didChange.send() } }
    
    private var defaults = UserDefaults.standard
    
    public func load() {
        self.godname = defaults.string(forKey: "godname") ?? ""
        self.token = defaults.string(forKey: "token") ?? ""
    }
    
    public func save(godname: String, token: String) {
        self.godname = godname
        self.token = token
        
        defaults.setValue(godname, forKey: "godname")
        defaults.setValue(token, forKey: "token")
    }
}

struct ContentView: View {
    @ObservedObject private var heroHandler = GodvilleDataHandler()
    
    @ObservedObject private var god = God()
    
    @State private var status: String = "Загружается"
    
    @State private var popUpShown: Bool = false
    
    let timer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            GameContentView(heroHandler: heroHandler, popUpShown: $popUpShown, status: status)
            
            if popUpShown {
                SettingsPopUpView(heroHandler: heroHandler,
                                  god: god,
                                  popUpShown: $popUpShown,
                                  updateStatus: updateStatus)
            }
            
        }
        .onAppear(perform: {
            withAnimation {
                god.load()
                
                status = "Загружается"
                heroHandler.getGodInfo(godname: god.godname, token: god.token, completeon: updateStatus)
            }
            
        })
        .onReceive(timer, perform: { _ in
            withAnimation {
                status = "Загружается"
                heroHandler.getGodInfo(godname: god.godname, token: god.token, completeon: updateStatus)
            }
        })
    }
    
    
    func updateStatus() {
        if god.godname == "" {
            status = "Введите имя бога в настройках."
            return
        }
        
        guard let heroInstance = heroHandler.instance else {
            status = "Ошибка загрузки."
            return
        }
        
        guard (heroInstance.expired ?? false) == false else {
            status = "Данные устарели и не обновляются. Зайдите в игру."
            return
        }
        
        guard (heroHandler.instance?.name ?? "") != "превышена частота запросов к серверу."  else {
            status = "Превышена частота запросов к серверу."
            return
        }
        
        status = ""
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .frame(width: 500.0, height: 1000)
        }
    }
}




