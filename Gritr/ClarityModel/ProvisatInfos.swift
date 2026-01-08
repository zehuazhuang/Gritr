

struct ProvisatInfos: Codable {
    var felickelId: Int
    var rimionhText: String
    var temoveVoice: String
    var nbtransTime: String
    var grgemoUserId: Int
    var oxenuatoChatId: Int
    var moakernSendTime: String

   
    static let `default` = ProvisatInfos(
        felickelId: -1,
        rimionhText:"",
        temoveVoice:"gritr_icon",
        nbtransTime: "",
        grgemoUserId: 0,
        oxenuatoChatId: 0,
        moakernSendTime:"",
    )
}
