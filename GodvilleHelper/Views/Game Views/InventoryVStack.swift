import SwiftUI

struct InventoryVStack: View {
    @ObservedObject var heroHandler: GodvilleDataHandler
    
    var body: some View {
        VStack(spacing: 0) {
            if let hero = heroHandler.instance {
                Spacer()
                    .frame(height: 10)
                
                HStack {
                    Text("Инвентарь")
                        .font(.headline)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                .padding([.horizontal])
                .padding(.bottom, 5)
                
                if let gold = hero.gold_approx {
                    if gold != "" {
                        TextHStack(title: "💰 Золота: ", description: gold)
                            .frame(height: 25, alignment: .leading)
                            .padding(.horizontal)
                    }
                }
                
                if let itemsCount = hero.inventory_num, let itemsMax = hero.inventory_max_num {
                    TextHStack(title: "📦 Предметов: ", description: "\(itemsCount)/\(itemsMax)")
                        .frame(height: 25, alignment: .leading)
                        .padding(.horizontal)
                }
                
                if let activatables = heroHandler.activatables {
                    TextHStack(title: "🌟 Можно активировать: ", description: "")
                        .frame(height: 25, alignment: .leading)
                        .padding(.horizontal)
                    HStack {
                        Text(activatables)
                            .multilineTextAlignment(.leading)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top, -3)
                    
                }
                
                Spacer()
                    .frame(height: 10)
            }
        }
    }
}
