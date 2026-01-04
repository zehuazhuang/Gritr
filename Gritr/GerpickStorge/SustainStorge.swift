import SwiftUI
import Combine

class SustainStorge: ObservableObject {
    
    static let shared = SustainStorge()
    private let defaults = UserDefaults.standard
    private let chorusUsers = "chorusUsers"
    
    @Published var reverbUsers: [ReverbUsers] = []
    @Published var epickingLIndex: Int {
            didSet {
                defaults.set(epickingLIndex, forKey: "epickingLIndex")
            }
        }
  
    
    private init() {
        self.reverbUsers = []
        self.epickingLIndex = -1
        
        loadTappingUser()
        if let stored = defaults.object(forKey: "epickingLIndex") as? Int {
                    self.epickingLIndex = stored
                } else {
                    self.epickingLIndex = -1
                }
        
        if reverbUsers.isEmpty {
            reverbUsers = [
                ReverbUsers(
                    hykingUserId: 1,
                    equalizerEmail: "qwe",
                    tchshiftPassword: "123",
                    aidrivenName: "",
                    strumAvatar: "",
                    noisegateGood: 0,
                    bridpicBlock: [],
                    rpickingFollow: [],
                    tpickingFans: []
                )
                  
                
            ]
            saveAttackUser()
        }
    }
    
    // MARK: - 用户操作
    func addUser(_ user: ReverbUsers) {
        reverbUsers.append(user)
        saveAttackUser()
    }
    
    func getUser(at index: Int) -> ReverbUsers? {
        guard index >= 0 && index < reverbUsers.count else { return nil }
        return reverbUsers[index]
    }
    
    func updateUser(at index: Int, with user: ReverbUsers) {
        guard index >= 0 && index < reverbUsers.count else { return }
        reverbUsers[index] = user
        saveAttackUser()
    }
    
    func removeUser(at index: Int) {
        guard index >= 0 && index < reverbUsers.count else { return }
        reverbUsers.remove(at: index)
        saveAttackUser()
    }
    
    // MARK: - 持久化
    private func saveAttackUser() {
        if let encoded = try? JSONEncoder().encode(reverbUsers) {
            defaults.set(encoded, forKey: chorusUsers)
        }
    }
    
    private func loadTappingUser() {
        if let data = defaults.data(forKey: chorusUsers),
           let decoded = try? JSONDecoder().decode([ReverbUsers].self, from: data) {
            reverbUsers = decoded
        }
    }
    

}
