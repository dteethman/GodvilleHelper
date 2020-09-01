
struct Pet: Decodable {
    let pet_class: String?
    let pet_level: String?
    let pet_name: String?
    let wounded: Bool?
    
    private enum CodingKeys: String, CodingKey {
        case pet_class = "pet_class"
        case pet_level = "pet_level"
        case pet_name = "pet_name"
        case wounded = "wounded"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            pet_level = try container.decode(String.self, forKey: .pet_level)
        } catch {
            do {
                pet_level = String(try container.decode(Int.self, forKey: .pet_level))
            } catch {
                pet_level = nil
            }
        }
        
        do {
            pet_class = try container.decode(String.self, forKey: .pet_class)
        } catch {
            pet_class = nil
        }
        
        do {
            pet_name = try container.decode(String.self, forKey: .pet_name)
        } catch {
            pet_name = nil
        }
        
        do {
            wounded = try container.decode(Bool.self, forKey: .wounded)
        } catch {
            wounded = nil
        }

    }
}
