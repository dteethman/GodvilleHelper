import SwiftUI

class GodvilleDataHandler: ObservableObject {
    @Published var instance: GodvilleHero?
    
    @Published var bio: String = ""
    
    @Published var healthColor: Color = .green
    @Published var heroAlignment: HeroAlignment = .none
    @Published var fightType: FightType = .none
    
    @Published var activatables: String?
    @Published var templeCompletedDate: String?
    @Published var arkCompletedDate: String?
    @Published var savingsCompletedDate: String?
    @Published var savings: Int?

    
    public func getGodInfo(godname: String, token: String? = nil, completeon: @escaping () -> () = { }) {
        
        if godname == "" {
            resetData()
            completeon()
            return
        }
        
        var  jsonUrl = "https://godville.net/gods/api/\(godname)"
        
        if token != nil {
            jsonUrl += "/\(token!)"
        }
        
        guard let encodedUrl = jsonUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        
        guard let url = URL(string: encodedUrl) else {
            print("Error encoding URL")
            return
            
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            print("API call")
            guard let data = data else { return }
            
            do {
                let hero = try JSONDecoder().decode(GodvilleHero.self, from: data)
                DispatchQueue.main.async {
                    self.instance = hero
                    self.healthColor = self.getHealthColor(hero: hero)
                    self.heroAlignment = self.getAlignment(hero: hero)
                    self.fightType = self.getFightType(hero: hero)
                    self.bio = self.getBio(hero: hero)
                    self.activatables = self.getActivatables(hero: hero)
                    self.savings = self.getSavings(hero: hero)
                    self.templeCompletedDate = self.getDataString(data: hero.temple_completed_at)
                    self.arkCompletedDate = self.getDataString(data: hero.ark_completed_at)
                    self.savingsCompletedDate = self.getDataString(data: hero.savings_completed_at)
                    completeon()
                }
            } catch {
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.resetData()
                    completeon()
                    
                }
            }
            
        }.resume()
    }
    
    func getBio(hero: GodvilleHero) -> String {
        var bioStr: String = ""
        var isMale = true
        
        if let gender = hero.gender {
            isMale = gender == "male"
        }
        
        if let clan = hero.clan {
            if clan != "" {
                bioStr.append("\(hero.clan_position!.capitalized)")
                bioStr.append(" клана «\(clan)»")
            } else {
                bioStr.append(isMale ? "Одинокий путник" : "Одинокая путница")
            }
        }
        
        if let motto = hero.motto {
            if motto != "" {
                bioStr.append(", ")
                bioStr.append(isMale ? "идущий" : "идущая")
                bioStr.append(" по миру со словами: «\(motto)»")
            }
        }
        
        if let godname = hero.godname {
            bioStr.append(", ")
            bioStr.append(isMale ? "ведомый" : "ведомая")
            bioStr.append(isMale ? " богом свим" : " богиней своей")
            bioStr.append(" \(godname).")
        }
        
        return bioStr
    }
    
    func getHealthColor(hero: GodvilleHero) -> Color {
        if let health = hero.health, let maxHealth = hero.max_health {
            switch CGFloat(health) / CGFloat (maxHealth) {
            case 0 ..< 0.3: return .red
            case 0.3 ..< 0.5: return .yellow
            case 0.7 ... 1: return .green
            default: return .green
            }
        } else {
            return .green
        }
    }
    
    func getAlignment(hero: GodvilleHero) -> HeroAlignment {
        if let alignment = hero.alignment{
            if let heroAl = HeroAlignment(rawValue: alignment) {
                return heroAl
            } else {
                return.none
            }
        } else {
            return .none
        }
    }
    
    func getFightType(hero: GodvilleHero) -> FightType {
        if let isFighting = hero.arena_fight {
            if isFighting {
                if let type = hero.fight_type {
                    if let fightType = FightType(rawValue: type) {
                        return fightType
                    }
                }
            }
        }
        return FightType.none
    }
    
    func getActivatables(hero: GodvilleHero) -> String? {
        if let activatables = hero.activatables {
            if activatables.count > 0 {
                var items: String = ""
                for (id, activatable) in activatables.enumerated() {
                    items.append(activatable)
                    if id != activatables.count - 1 {
                        items.append(", ")
                    }
                }
                return items
            }
        }
        return nil
    }
    
    func getSavings(hero: GodvilleHero) -> Int? {
        if let savings = hero.savings {
                return Int(savings.filter("0123456789.".contains)) ?? nil
        } else {
            return nil
        }
    }
    
    func getDataString(data: String?) -> String? {
        if let data = data {
            if data.count > 9 {
                var dataStr = ""
                dataStr.append(data[8...9])
                dataStr.append(".")
                dataStr.append(data[5...6])
                dataStr.append(".")
                dataStr.append(data[0...3])
                return dataStr
            } else {
                return nil
            }

        } else {
            return nil
        }
    }
    
    func resetData() {
        self.instance = nil
        self.healthColor = .green
        self.heroAlignment = .none
        self.fightType = .none
        self.bio = ""
        self.activatables = nil
        self.savings = nil
        self.templeCompletedDate = nil
        self.arkCompletedDate = nil
        self.savingsCompletedDate = nil
    }
    
}

extension String {
    subscript (bounds: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start...end])
    }

    subscript (bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }
}
