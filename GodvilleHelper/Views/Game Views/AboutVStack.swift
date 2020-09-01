import SwiftUI

struct AboutVStack: View {
    @ObservedObject var heroHandler: GodvilleDataHandler
    
    var body: some View {
        VStack {
            if let hero = heroHandler.instance {
                Spacer()
                    .frame(height: 10)
                if let name = hero.name {
                    HStack {
                        Text("Герой: ")
                            .font(.title)
                            .fontWeight(.bold)
                        Text(name)
                            .font(.title)
                        Spacer()
                    }
                }
                HStack {
                    Text(heroHandler.bio)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                }
                Spacer()
                    .frame(height: 10)
            }
        }
        .padding(.horizontal, 15)
    }
}

