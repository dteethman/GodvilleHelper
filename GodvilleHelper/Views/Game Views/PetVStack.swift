import SwiftUI

struct PetVStack: View {
    @ObservedObject var heroHandler: GodvilleDataHandler
    
    var body: some View {
        VStack(spacing: 0) {
            if let hero = heroHandler.instance {
                if let pet = hero.pet {
                    Spacer()
                        .frame(height: 10)
                    
                    HStack {
                        Text("Питомец")
                            .font(.headline)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    .padding([.horizontal])
                    .padding(.bottom, 5)
                    
                    if let name = pet.pet_name {
                        TextHStack(title: "🦮 Имя: ", description: "\(name)")
                            .frame(height: 25, alignment: .leading)
                            .padding(.horizontal)
                    }
                    
                    if let petClass = pet.pet_class {
                        TextHStack(title: "🐾 Вид: ", description: "\(petClass)")
                            .frame(height: 25, alignment: .leading)
                            .padding(.horizontal)
                    }
                    
                    if let level = pet.pet_level {
                        if level != "" {
                            TextHStack(title: "🎓 Уровень: ", description: "\(level)")
                                .frame(height: 25, alignment: .leading)
                                .padding(.horizontal)
                        }
                    }
                    
                    Spacer()
                        .frame(height: 10)
                }
                
            }
        }
    }
}
