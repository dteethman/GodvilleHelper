import SwiftUI

struct AcievementsVStack: View {
    @ObservedObject var heroHandler: GodvilleDataHandler
    
    var body: some View {
        VStack(spacing: 0) {
            if let hero = heroHandler.instance {
                Spacer()
                    .frame(height: 10)
                HStack {
                    Text("Успехи")
                        .font(.headline)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                .padding([.horizontal])
                .padding(.bottom, 5)
                .cornerRadius(10)
                
                if let won = hero.arena_won, let lost = hero.arena_lost {
                    TextHStack(title: "👊 Арена: ", description: "\(won)/\(lost)")
                        .frame(height: 25, alignment: .leading)
                        .padding(.horizontal)
                }
                
                if let bricksCnt = hero.bricks_cnt {
                    if let templeCompleted = heroHandler.templeCompletedDate {
                        TextHStack(title: "🕍 Храм построен: ", description: templeCompleted)
                            .frame(height: 25, alignment: .leading)
                            .padding(.horizontal)
                    } else {
                        ProgressHStack(title: "🕍 Собрано кирпичей: ",
                                       description: "\(String(bricksCnt))/1000",
                                       progress: (CGFloat(bricksCnt) / 1000),
                                       backgroundColor: .blue,
                                       foregroundColor: .blue)
                            .frame(height: 25, alignment: .leading)
                            .padding(.horizontal)
                        
                    }
                    
                }
                
                if let woodCnt = hero.wood_cnt {
                    if let arkCompleted = heroHandler.arkCompletedDate {
                        TextHStack(title: "🚢 Ковчег построен: ", description: arkCompleted)
                            .frame(height: 25, alignment: .leading)
                            .padding(.horizontal)
                    } else {
                        ProgressHStack(title: "🚢 Собрано досок: ",
                                       description: "\(String(woodCnt))/1000",
                                       progress: (CGFloat(woodCnt) / 1000),
                                       backgroundColor: .blue,
                                       foregroundColor: .blue)
                            .frame(height: 25, alignment: .leading)
                            .padding(.horizontal)
                    }
                }
                
                if let savings = heroHandler.savings {
                    if let arkCompleted = heroHandler.savingsCompletedDate {
                        TextHStack(title: "🏦 Пенсия скоплена: ", description: arkCompleted)
                            .frame(height: 25, alignment: .leading)
                            .padding(.horizontal)
                    } else {
                        ProgressHStack(title: "🏦 Скоплено на пенсию: ",
                                       description: "\(String(savings))k/30000k",
                                       progress: (CGFloat(savings) / 30000),
                                       backgroundColor: .blue,
                                       foregroundColor: .blue)
                            .frame(height: 25, alignment: .leading)
                            .padding(.horizontal)
                    }
                }
                
                if let arkM = hero.ark_m, let arkF = hero.ark_f {
                    if arkM >= 1000 && arkF >= 1000 {
                        TextHStack(title: "🐮 Твари собраны! ", description: "")
                            .frame(height: 25, alignment: .leading)
                            .padding(.horizontal)
                    } else {
                        ProgressHStack(title: "🐮 Собрано тварей: ",
                                       description: "\(String(arkM)) + \(String(arkF))",
                                       progress: (CGFloat(arkM + arkF) / 2000),
                                       backgroundColor: .blue,
                                       foregroundColor: .blue)
                            .frame(height: 25, alignment: .leading)
                            .padding(.horizontal)
                    }
                }
                
                if let shop = hero.shop_name, let shopLevel = hero.t_level {
                    TextHStack(title: "🛒 Лавка: ", description: "\(shop) (\(shopLevel) ур.)")
                        .frame(height: 25, alignment: .leading)
                        .padding(.horizontal)
                    
                }
                
                if let wordsCount = hero.words {
                    ProgressHStack(title: "📖 Собрано слов: ",
                                   description: "\(String(wordsCount))/1000",
                                   progress: (CGFloat(wordsCount) / 1000),
                                   backgroundColor: .blue,
                                   foregroundColor: .blue)
                        .frame(height: 25, alignment: .leading)
                        .padding(.horizontal)
                }
                
                Spacer()
                    .frame(height: 10)
            }
        }
    }
}
