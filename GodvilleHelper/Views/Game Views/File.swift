import SwiftUI

struct GameContentView: View {
    @ObservedObject var heroHandler: GodvilleDataHandler
    
    @Binding var popUpShown: Bool
    
    var status: String
    
    
    var body: some View {
        VStack {
            Text(status)
                .padding(.top, 10)
                .frame(height: 20, alignment: .center)
                .frame(minWidth: 500, idealWidth: 500, maxWidth: 500)
                .fixedSize(horizontal: false, vertical: true)
            
            if status == "" {
                ScrollView {
                    VStack(alignment: .leading, spacing: 10)  {
                        AboutVStack(heroHandler: heroHandler)
                            .frame(minWidth: 480, idealWidth: 500, maxWidth: 600, alignment: .topLeading)
                            .background(Color("foregroundColor"))
                            .cornerRadius(10)
                            .padding(.horizontal, 10)
                        
                        StatsVStack(heroHandler: heroHandler)
                            .frame(minWidth: 480, idealWidth: 500, maxWidth: 600, alignment: .topLeading)
                            .background(Color("foregroundColor"))
                            .cornerRadius(10)
                            .padding(.horizontal, 10)
                        
                        AcievementsVStack(heroHandler: heroHandler)
                            .frame(minWidth: 480, idealWidth: 500, maxWidth: 600, alignment: .topLeading)
                            .background(Color("foregroundColor"))
                            .cornerRadius(10)
                            .padding(.horizontal, 10)
                        
                        if let quest = heroHandler.instance?.quest {
                            if quest != "" {
                                QuestVStack(heroHandler: heroHandler)
                                    .frame(minWidth: 480, idealWidth: 500, maxWidth: 600, alignment: .topLeading)
                                    .background(Color("foregroundColor"))
                                    .cornerRadius(10)
                                    .padding(.horizontal, 10)
                            }
                        }
                        
                        if let gold = heroHandler.instance?.gold_approx {
                            if gold != "" {
                                InventoryVStack(heroHandler: heroHandler)
                                    .frame(minWidth: 480, idealWidth: 500, maxWidth: 600, alignment: .topLeading)
                                    .background(Color("foregroundColor"))
                                    .cornerRadius(10)
                                    .padding(.horizontal, 10)
                            }
                        }
                        
                        if heroHandler.instance?.pet != nil {
                            PetVStack(heroHandler: heroHandler)
                                .frame(minWidth: 480, idealWidth: 500, maxWidth: 600, alignment: .topLeading)
                                .background(Color("foregroundColor"))
                                .cornerRadius(10)
                                .padding(.horizontal, 10)
                        }
                        
                        if heroHandler.instance?.boss_name != nil && heroHandler.instance?.boss_power != nil {
                            BossVStack(heroHandler: heroHandler)
                                .frame(minWidth: 480, idealWidth: 500, maxWidth: 600, alignment: .topLeading)
                                .background(Color("foregroundColor"))
                                .cornerRadius(10)
                                .padding(.horizontal, 10)
                        }
                        
                        
                        if heroHandler.instance?.diary_last != nil {
                            DiaryVStack(heroHandler: heroHandler)
                                .frame(minWidth: 480, idealWidth: 500, maxWidth: 600, alignment: .topLeading)
                                .background(Color("foregroundColor"))
                                .cornerRadius(10)
                                .padding(.horizontal, 10)
                        }
                    }
                }
                .background(Color("backgroundColor"))
                
                .frame(minWidth: 500, idealWidth: 500, maxWidth: 500, minHeight: 500, idealHeight: 1200, maxHeight: .infinity)
            } else {
                Spacer()
            }
            
            
            Button(action: {
                withAnimation {
                    popUpShown.toggle()
                }
                
            }, label: {
                Text("Настройки")
            })
            
            Spacer()
                .frame(height: 15)
        }
        .background(Color("backgroundColor"))
        .frame(minWidth: 500, idealWidth: 500, maxWidth: 500, minHeight: 500, idealHeight: 1200, maxHeight: .infinity)
    }
}
