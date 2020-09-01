import SwiftUI

struct BossVStack: View {
    @ObservedObject var heroHandler: GodvilleDataHandler
    
    var body: some View {
        VStack(spacing: 0) {
            if let hero = heroHandler.instance {
                if let name = hero.boss_name, let power = hero.boss_power {
                    Spacer()
                        .frame(height: 10)
                    
                    HStack {
                        Text("Босс")
                            .font(.headline)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    .padding([.horizontal])
                    .padding(.bottom, 5)
                    
                    TextHStack(title: "👽 Имя: ", description: "\(name)")
                        .frame(height: 25, alignment: .leading)
                        .padding(.horizontal)
                    
                    TextHStack(title: "💪 Сила: ", description: "\(power)")
                        .frame(height: 25, alignment: .leading)
                        .padding(.horizontal)
                    
                    Spacer()
                        .frame(height: 10)
                }
                
            }
        }
    }
}
