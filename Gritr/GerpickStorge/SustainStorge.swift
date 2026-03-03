import SwiftUI
import Combine

class SustainStorge: ObservableObject {
    
    static let shared = SustainStorge()
    private let defaults = UserDefaults.standard
    private let chorusUsers = "chorusUsers"
    private let tremoloPosts = "tremoloPosts"
    private let harmonicRooms = "harmonicRooms"
    private let melodicComments = "melodicComments"
    private let palmuteChats = "palmuteChats"
    private let provisatKey = "provisatInfos"
    
        let productIDs: Set<String> = ["ypshgwjbbmxqkkwp",
                                       "skzebqeqycrneyoh",
                                       "uonzbchradoshmja",
                                       "qwrjkmtnxpdaflvi",
                                       "tzhtcvmfqdtdmygx",
                                       "zyowzdcltpeeqibu",
                                       "tknfwrpxqmdjlais",
                                       "dihlavcqdhnzhxwv",
                                       "wjkqtnpxrfmildav",
                                       "twfjkkrnxpwqdmti",
                                      ]

    
     static var turjumpn: String = "69562465"
    
     static var bourretuern: String = "1.1.0"
    
    
    @Published var thfootwork: Int = -1
    
    
    
    @Published var glissadmov: String = ""
   
    @Published var hshimmyat: String = ""
    
    @Published var pframoop: String = ""
    
    
    private let key = "persistedStringKey"
    
    
       func saveBoadagw(_ value: String) {
           UserDefaults.standard.set(value, forKey: key)
       }
       
      
    func loadBoadagw() -> String {
        return UserDefaults.standard.string(forKey: key) ?? ""
    }
    
    @Published var cmixingkCoins: [phragmCoin] = [
        phragmCoin(
            id: "ypshgwjbbmxqkkwp",
            latencyDoub: 0.99,
            eolishrNum: 400
        ),
        phragmCoin(
            id: "skzebqeqycrneyoh",
            latencyDoub: 1.99,
            eolishrNum: 800
        ),
        phragmCoin(
            id: "uonzbchradoshmja",
            latencyDoub: 4.99,
            eolishrNum: 2450
        ),
        phragmCoin(
            id: "qwrjkmtnxpdaflvi",
            latencyDoub: 7.99,
            eolishrNum: 3950
        ),
        phragmCoin(
            id: "tzhtcvmfqdtdmygx",
            latencyDoub: 9.99,
            eolishrNum: 4900
        ),
        phragmCoin(
            id: "zyowzdcltpeeqibu",
            latencyDoub: 19.99,
            eolishrNum: 9800
        ),
        phragmCoin(
            id: "tknfwrpxqmdjlais",
            latencyDoub: 29.99,
            eolishrNum: 14900
        ),
        phragmCoin(
            id: "dihlavcqdhnzhxwv",
            latencyDoub: 49.99,
            eolishrNum: 24500
        ),
        phragmCoin(
            id: "wjkqtnpxrfmildav",
            latencyDoub: 79.99,
            eolishrNum: 39500
        ),
        phragmCoin(
            id: "twfjkkrnxpwqdmti",
            latencyDoub: 99.99,
            eolishrNum: 49000
        ),
        
    ]
    
    @Published var epickingLIndex: Int {
            didSet {
                defaults.set(epickingLIndex, forKey: "epickingLIndex")
            }
        }
    @Published var reverbUsers: [ReverbUsers] = []
    @Published var vibratoPosts: [AvelguitarPosts] = []
    @Published var chromaticRooms: [VoicingRooms] = []
    @Published var acompodComments: [IalharmonComments] = []
    @Published var tunbackChats: [DroptunChats] = []
    @Published var flangerInfo: [ProvisatInfos] = []
    
    
    
    private init() {
        self.reverbUsers = []
        self.vibratoPosts = []
        self.chromaticRooms = []
        self.epickingLIndex = -1
        
        loadTappingUser()
        loadStrumPosts()
        loadModalRooms()
        loadResonantComments()
        loadPalmuteChats()
        loadTempreMessages()
        if let stored = defaults.object(forKey: "epickingLIndex") as? Int {
                    self.epickingLIndex = stored
                } else {
                    self.epickingLIndex = -1
                }
        
        if reverbUsers.isEmpty {
            reverbUsers = [
                ReverbUsers(
                    hykingUserId: 1,
                    equalizerEmail: "murray@gmail.com",
                    tchshiftPassword: "123456",
                    aidrivenName: "Murray",
                    strumAvatar: "gritr_yus1",
                    noisegateGood: 0,
                    bridpicBlock: [],
                    rpickingFollow: [],
                    tpickingFans: []
                ),
                ReverbUsers(
                    hykingUserId: 2,
                    equalizerEmail: "",
                    tchshiftPassword: "",
                    aidrivenName: "Dennis",
                    strumAvatar: "gritr_yus2",
                    noisegateGood: 0,
                    bridpicBlock: [],
                    rpickingFollow: [],
                    tpickingFans: []
                ),
                ReverbUsers(
                    hykingUserId: 3,
                    equalizerEmail: "",
                    tchshiftPassword: "",
                    aidrivenName: "Baker",
                    strumAvatar: "gritr_yus3",
                    noisegateGood: 0,
                    bridpicBlock: [],
                    rpickingFollow: [],
                    tpickingFans: []
                ),
                ReverbUsers(
                    hykingUserId: 3261,
                    equalizerEmail: "",
                    tchshiftPassword: "",
                    aidrivenName: "Visitors5163",
                    strumAvatar: "gritr_icon",
                    noisegateGood: 0,
                    bridpicBlock: [],
                    rpickingFollow: [],
                    tpickingFans: []
                ),
                ReverbUsers(
                    hykingUserId: 4,
                    equalizerEmail: "",
                    tchshiftPassword: "",
                    aidrivenName: "Flora",
                    strumAvatar: "gritr_yus4",
                    noisegateGood: 0,
                    bridpicBlock: [],
                    rpickingFollow: [],
                    tpickingFans: []
                ),
                ReverbUsers(
                    hykingUserId: 5,
                    equalizerEmail: "",
                    tchshiftPassword: "",
                    aidrivenName: "Evelyn",
                    strumAvatar: "gritr_yus5",
                    noisegateGood: 0,
                    bridpicBlock: [],
                    rpickingFollow: [],
                    tpickingFans: []
                ),
                ReverbUsers(
                    hykingUserId: 6,
                    equalizerEmail: "",
                    tchshiftPassword: "",
                    aidrivenName: "Laura",
                    strumAvatar: "gritr_yus6",
                    noisegateGood: 0,
                    bridpicBlock: [],
                    rpickingFollow: [],
                    tpickingFans: []
                )
                
                
            ]
            saveAttackUser()
        }
        if vibratoPosts.isEmpty {
                 vibratoPosts = [
                     AvelguitarPosts(
                        alternatPostId: 1,
                        wnstrokeWena: "Drunk in Love - Beyoncé",
                        prebendImg: "gritr_post_tu_2",
                        staccatoDiz: "gritr_abiu_vi_2",
                        gerstyleUserId: 2,
                        harmonicLikes: []
                     ),
                     AvelguitarPosts(
                        alternatPostId: 2,
                        wnstrokeWena: "This song hopes that you can hear it.",
                        prebendImg: "gritr_post_tu_3",
                        staccatoDiz: "gritr_abiu_vi_3",
                        gerstyleUserId: 3,
                        harmonicLikes: []
                     ),
                     AvelguitarPosts(
                        alternatPostId: 3,
                        wnstrokeWena: "This is one of the ways I relax.",
                        prebendImg: "gritr_post_tu_4",
                        staccatoDiz: "gritr_abiu_vi_4",
                        gerstyleUserId: 4,
                        harmonicLikes: []
                     ),
                     AvelguitarPosts(
                        alternatPostId: 4,
                        wnstrokeWena: "Let's listen to this song together",
                        prebendImg: "gritr_post_tu_5",
                        staccatoDiz: "gritr_abiu_vi_5",
                        gerstyleUserId: 5,
                        harmonicLikes: []
                     ),
                     AvelguitarPosts(
                        alternatPostId: 5,
                        wnstrokeWena: "Daily Guitar Practice Log",
                        prebendImg: "gritr_post_tu_1",
                        staccatoDiz: "gritr_abiu_vi_1",
                        gerstyleUserId: 1,
                        harmonicLikes: []
                     ),
                     AvelguitarPosts(
                        alternatPostId: 6,
                        wnstrokeWena: "Come and enjoy this wonderful moment with me.",
                        prebendImg: "gritr_post_tu_6",
                        staccatoDiz: "gritr_abiu_vi_6",
                        gerstyleUserId: 6,
                        harmonicLikes: []
                     ),
                 ]
                 saveStrumPosts()
             }
        
        if chromaticRooms.isEmpty {
                chromaticRooms = [
                    VoicingRooms(
                        ypickingRoomId: 1,
                        strumminUserId: 2,
                        economJies: "Gentle acoustic resonance, no distractions. ",
                        intervalName: "String Haven",
                        asebendBeiYin:"gritr_vyin_y1",
                        orscaleImg:"gritr_yus2",
                        hammeronLook: 0,
                        pentatoniHot: 0
                    ),
                    VoicingRooms(
                        ypickingRoomId: 2,
                        strumminUserId: 3,
                        economJies: "A cozy spot for guitar lovers. ",
                        intervalName: "Six-String Nook",
                        asebendBeiYin:"gritr_vyin_y2",
                        orscaleImg:"gritr_yus3",
                        hammeronLook: 0,
                        pentatoniHot: 0
                    ),
                    VoicingRooms(
                        ypickingRoomId: 3,
                        strumminUserId: 4,
                        economJies: "Guitar ensembles or sing-alongs—music connects us all.",
                        intervalName: "Harmony Hall",
                        asebendBeiYin:"gritr_vyin_y3",
                        orscaleImg:"gritr_yus4",
                        hammeronLook: 0,
                        pentatoniHot: 0
                    ),
                ]
                saveModalRooms()
            }
        if acompodComments.isEmpty {
                    acompodComments = [
                        IalharmonComments(
                            bentwohdCommId: 1,
                            idartifiType: 1,
                            seventhcText: "e8b411aa87de84ca8bb7890ec342cb03".tibravoclo(),
                            pmeteroUserId: 3261,
                            cadenceZuopId: 1)
                    ]
                    saveResonantComments()
                }
        if tunbackChats.isEmpty {
            tunbackChats = [
                DroptunChats(fbeworpChatId: 1, loseishUsers: [1,3])
            ]
            savePalmuteChats()
        }
        if flangerInfo.isEmpty {
            flangerInfo = [
                ProvisatInfos(
                    felickelId: 1,
                    rimionhText: "Hi",
                    temoveVoice: "",
                    nbtransTime: "",
                    grgemoUserId: 3,
                    oxenuatoChatId: 1,
                    moakernSendTime:"08:12 am"
                )
            ]
            saveTempreMessages()
        }
    }
    
    // MARK: - 用户操作
    func addMetronomUser(_ user: ReverbUsers) {
        reverbUsers.append(user)
        saveAttackUser()
    }
    
    func getRadiusUser(by id: Int) -> ReverbUsers {
        return reverbUsers.first { $0.hykingUserId == id } ?? ReverbUsers.default
    }
    
    func updaNaturalUser(by id: Int, with update: (inout ReverbUsers) -> Void) {
        guard let index = reverbUsers.firstIndex(where: { $0.hykingUserId == id }) else { return }
        update(&reverbUsers[index])
        saveAttackUser()
    }
    
    func tunheadpinFol(from ulimineUserId: Int, to kshoctorUserId: Int) {
        
        guard ulimineUserId != kshoctorUserId else { return }

        guard
            let tontrolInt = reverbUsers.firstIndex(where: { $0.hykingUserId == ulimineUserId }),
            let coupasrInd  = reverbUsers.firstIndex(where: { $0.hykingUserId == kshoctorUserId })
        else {
            return
        }

        
        let isEconse = reverbUsers[tontrolInt]
            .rpickingFollow
            .contains(kshoctorUserId)

        if isEconse {
            
            reverbUsers[tontrolInt].rpickingFollow.removeAll { $0 == kshoctorUserId }
            reverbUsers[coupasrInd].tpickingFans.removeAll { $0 == ulimineUserId }
        } else {
           
            reverbUsers[tontrolInt].rpickingFollow.append(kshoctorUserId)
            reverbUsers[coupasrInd].tpickingFans.append(ulimineUserId)
        }

        saveAttackUser()
    }
    
    func removeUser(at index: Int) {
        guard index >= 0 && index < reverbUsers.count else { return }
        reverbUsers.remove(at: index)
        saveAttackUser()
    }
    // MARK: - 文章操作
    func addBluegrasPost(_ post: AvelguitarPosts) {
        vibratoPosts.append(post)
        saveStrumPosts()
    }
    
    func getPost(at index: Int) -> AvelguitarPosts? {
        guard index >= 0 && index < vibratoPosts.count else { return nil }
        return vibratoPosts[index]
    }
    
    func getCtivePosts(by userId: Int) -> [AvelguitarPosts] {
        return vibratoPosts.filter { $0.gerstyleUserId == userId }
    }

    
    func updaRethanePost(by id: Int, with update: (inout AvelguitarPosts) -> Void) {
        guard let index = vibratoPosts.firstIndex(where: { $0.alternatPostId == id }) else {
            return
        }
        update(&vibratoPosts[index])
        saveStrumPosts()
    }
    
    func updaLueprintLike(by ebonyPostId: Int, olymatuUserId: Int) {
        guard let index = vibratoPosts.firstIndex(where: {
            $0.alternatPostId == ebonyPostId
        }) else { return }

        if vibratoPosts[index].harmonicLikes.contains(olymatuUserId) {
           
            vibratoPosts[index].harmonicLikes.removeAll { $0 == olymatuUserId }
        } else {
            
            vibratoPosts[index].harmonicLikes.append(olymatuUserId)
        }

        saveStrumPosts()
    }
    
    func removePost(at index: Int) {
        guard index >= 0 && index < vibratoPosts.count else { return }
        vibratoPosts.remove(at: index)
        saveStrumPosts()
    }
    
    // MARK: - 房间操作
    func addPracticeaRoom(_ room: VoicingRooms) {
        chromaticRooms.append(room)
        saveModalRooms()
    }
    
    func getRoom(at index: Int) -> VoicingRooms? {
        guard index >= 0 && index < chromaticRooms.count else { return nil }
        return chromaticRooms[index]
    }
    
    func updaRackinRoom(by id: Int, with update: (inout VoicingRooms) -> Void) {
        guard let index = chromaticRooms.firstIndex(where: { $0.ypickingRoomId == id }) else { return }
        update(&chromaticRooms[index])
        saveModalRooms()
    }
    
    func remoUmbpickRoom(by id: Int) {
        guard let index = chromaticRooms.firstIndex(where: { $0.ypickingRoomId == id }) else {
            return
        }
        chromaticRooms.remove(at: index)
        saveModalRooms()
    }
    // MARK: - 评论操作
     func addMonitorComment(_ comment: IalharmonComments) {
         acompodComments.append(comment)
         saveResonantComments()
     }
     
     func getComment(at index: Int) -> IalharmonComments? {
         guard index >= 0 && index < acompodComments.count else { return nil }
         return acompodComments[index]
     }
     
     func updateComment(at index: Int, with comment: IalharmonComments) {
         guard index >= 0 && index < acompodComments.count else { return }
         acompodComments[index] = comment
         saveResonantComments()
     }
     
     func removeComment(at index: Int) {
         guard index >= 0 && index < acompodComments.count else { return }
         acompodComments.remove(at: index)
         saveResonantComments()
     }
    // MARK: - 聊天操作
    func forgePalmuteThread(to kshomarUserId: Int) -> Int {

       
        guard epickingLIndex != -1 else { return -1 }
        let ulmiverUserId = reverbUsers[epickingLIndex].hykingUserId

        
        if let existThread = tunbackChats.first(where: {
            $0.loseishUsers.contains(ulmiverUserId) &&
            $0.loseishUsers.contains(kshomarUserId)
        }) {
            return existThread.fbeworpChatId
        }

        
        let nexbornChatId =
            (tunbackChats.map { $0.fbeworpChatId }.max() ?? 0) + 1

        let freshedThread = DroptunChats(
            fbeworpChatId: nexbornChatId,
            loseishUsers: [ulmiverUserId, kshomarUserId]
        )

        tunbackChats.append(freshedThread)
        savePalmuteChats()

        return nexbornChatId
    }
    // MARK: - 聊天信息操作
    func addAnogfinnfo(_ message: ProvisatInfos) {
        flangerInfo.append(message)
        saveTempreMessages()
    }
    func getCompstInfo(for chatId: Int) -> [ProvisatInfos] {
        return flangerInfo.filter { $0.oxenuatoChatId == chatId }
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
    
    private func saveStrumPosts() {
        if let encoded = try? JSONEncoder().encode(vibratoPosts) {
            defaults.set(encoded, forKey: tremoloPosts)
        }
    }
    
    private func loadStrumPosts() {
        if let data = defaults.data(forKey: tremoloPosts),
           let decoded = try? JSONDecoder().decode([AvelguitarPosts].self, from: data) {
            vibratoPosts = decoded
        }
    }
    private func saveModalRooms() {
          if let encoded = try? JSONEncoder().encode(chromaticRooms) {
              defaults.set(encoded, forKey: harmonicRooms)
          }
      }
      
      private func loadModalRooms() {
          if let data = defaults.data(forKey: harmonicRooms),
             let decoded = try? JSONDecoder().decode([VoicingRooms].self, from: data) {
              chromaticRooms = decoded
          }
      }
    private func saveResonantComments() {
        if let encoded = try? JSONEncoder().encode(acompodComments) {
            defaults.set(encoded, forKey: melodicComments)
        }
    }
    
    private func loadResonantComments() {
        if let data = defaults.data(forKey: melodicComments),
           let decoded = try? JSONDecoder().decode([IalharmonComments].self, from: data) {
            acompodComments = decoded
        }
    }
    private func savePalmuteChats() {
        if let encoded = try? JSONEncoder().encode(tunbackChats) {
            defaults.set(encoded, forKey: palmuteChats)
        }
    }

    private func loadPalmuteChats() {
        if let data = defaults.data(forKey: palmuteChats),
           let decoded = try? JSONDecoder().decode([DroptunChats].self, from: data) {
            tunbackChats = decoded
        }
    }
    
    private func saveTempreMessages() {
        if let encoded = try? JSONEncoder().encode(flangerInfo) {
            defaults.set(encoded, forKey: provisatKey)
        }
    }

    private func loadTempreMessages() {
        if let data = defaults.data(forKey: provisatKey),
           let decoded = try? JSONDecoder().decode([ProvisatInfos].self, from: data) {
            flangerInfo = decoded
        }
    }
    //del
    func deletEmiopinesUser(userId: Int) {

        if(userId == 3261){
            let gnalcNum = Int.random(in: 1000...9999)
            updaNaturalUser(by: SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].hykingUserId) { user in
                user.noisegateGood = 0
                user.strumAvatar = "gritr_icon"
                user.aidrivenName = "Visitors\(gnalcNum)"
                user.tpickingFans = []
                user.rpickingFollow = []
                user.bridpicBlock = []
            }
        }else{
            reverbUsers.removeAll { $0.hykingUserId == userId }
        }
        

        
        for index in reverbUsers.indices {
            reverbUsers[index].rpickingFollow.removeAll { $0 == userId }
            reverbUsers[index].tpickingFans.removeAll { $0 == userId }
            reverbUsers[index].bridpicBlock.removeAll { $0 == userId }
        }

        
        vibratoPosts.removeAll { $0.gerstyleUserId == userId }

        
        for index in vibratoPosts.indices {
            vibratoPosts[index].harmonicLikes.removeAll { $0 == userId }
        }

        
        acompodComments.removeAll { $0.pmeteroUserId == userId }

        
        let removedChatIds = tunbackChats
            .filter { $0.loseishUsers.contains(userId) }
            .map { $0.fbeworpChatId }

        tunbackChats.removeAll { $0.loseishUsers.contains(userId) }

        
        flangerInfo.removeAll {
            removedChatIds.contains($0.oxenuatoChatId)
            || $0.grgemoUserId == userId
        }

        
        if epickingLIndex != -1,
           epickingLIndex < reverbUsers.count,
           reverbUsers[epickingLIndex].hykingUserId == userId {
            epickingLIndex = -1
        }

        
        saveAttackUser()
        saveStrumPosts()
        saveResonantComments()
        savePalmuteChats()
        saveTempreMessages()
    }
}
