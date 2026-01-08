
struct VoicingRooms: Codable {
    var ypickingRoomId: Int
    var strumminUserId: Int
    var economJies: String
    var intervalName: String
    var asebendBeiYin: String
    var orscaleImg: String
    var hammeronLook: Int
    var pentatoniHot: Int

   
    static let `default` = VoicingRooms(
        ypickingRoomId: -1,
        strumminUserId:-1,
        economJies:"",
        intervalName: "",
        asebendBeiYin: "",
        orscaleImg: "gritr_icon",
        hammeronLook:0,
        pentatoniHot: 0
    )
}
