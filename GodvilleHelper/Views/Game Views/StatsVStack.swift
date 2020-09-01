import SwiftUI

struct StatsVStack: View {
    @ObservedObject var heroHandler: GodvilleDataHandler
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if let hero = heroHandler.instance {
                Spacer()
                    .frame(height: 10)
                
                HStack {
                    Text("О персонаже")
                        .font(.headline)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.bottom, 5)
                
                if let maxHealth = hero.max_health {
                    if let health = hero.health {
                        ProgressHStack(title: "❤️ Здоровье: ",
                                       description: "\(String(health))/\(String(maxHealth))",
                                       progress: (CGFloat(health) / CGFloat(maxHealth)),
                                       backgroundColor: heroHandler.healthColor,
                                       foregroundColor: heroHandler.healthColor)
                            .frame(height: 25, alignment: .leading)
                            .padding(.horizontal)
                        
                    } else {
                        TextHStack(title: "❤️ Здоровье: ", description: "\(maxHealth)")
                            .frame(height: 25, alignment: .leading)
                            .padding(.horizontal)
                    }
                }
                
                if let level = hero.level {
                    if let expProgress = hero.exp_progress {
                        ProgressHStack(title: "🎓 Уровень: ",
                                       description: "\(String(level)) (\(String(expProgress))%)",
                                       progress: (CGFloat(expProgress) / 100),
                                       backgroundColor: .blue,
                                       foregroundColor: .blue)
                            .frame(height: 25, alignment: .leading)
                            .padding(.horizontal)
                        
                    } else {
                        TextHStack(title: "🎓 Уровень: ", description: "\(level)")
                            .frame(height: 25, alignment: .leading)
                            .padding(.horizontal)
                    }
                }
                
                if let godpower = hero.godpower {
                    TextHStack(title: "🙏 Прана: ", description: "\(godpower)")
                        .frame(height: 25, alignment: .leading)
                        .padding(.horizontal)
                }
                
                if heroHandler.heroAlignment != .none {
                    TextHStack(title: "\(heroHandler.heroAlignment.emoji) Характер: ", description: "\(heroHandler.heroAlignment.description)")
                        .frame(height: 25, alignment: .leading)
                        .padding(.horizontal)
                }
                
                if let aura = hero.aura {
                    TextHStack(title: "💫 Аура: ", description: "\(aura)")
                        .frame(height: 25, alignment: .leading)
                        .padding(.horizontal)
                }
                
                if let isFighting = hero.arena_fight {
                    if isFighting {
                        TextHStack(title: "⚔️ Сражается ", description: heroHandler.fightType.description)
                            .frame(height: 25, alignment: .leading)
                            .padding(.horizontal)
                    } else if let townName = hero.town_name, let distance = hero.distance {
                        if townName != "" {
                            TextHStack(title: "🏘 Город: ", description: "\(townName)")
                                .frame(height: 25, alignment: .leading)
                                .padding(.horizontal)
                        } else {
                            TextHStack(title: "📍 Столб: ", description: "\(distance)")
                                .frame(height: 25, alignment: .leading)
                                .padding(.horizontal)
                        }
                    }

                }
                
                Spacer()
                    .frame(height: 10)
            }
        }
    }
}
