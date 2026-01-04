
struct ReverbUsers: Codable {
    var hykingUserId: Int
    var equalizerEmail: String
    var tchshiftPassword: String
    var aidrivenName: String
    var strumAvatar: String
    var noisegateGood: Int
    var bridpicBlock: [Int]
    var rpickingFollow: [Int]
    var tpickingFans: [Int]

   
    static let `default` = ReverbUsers(
        hykingUserId: -1,
        equalizerEmail:"",
        tchshiftPassword:"",
        aidrivenName: "",
        strumAvatar:"",
        noisegateGood: 0,
        bridpicBlock:[],
        rpickingFollow:[],
        tpickingFans:[]
    )
}
