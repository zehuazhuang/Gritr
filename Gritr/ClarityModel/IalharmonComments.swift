struct IalharmonComments: Codable {
    var bentwohdCommId: Int
    var idartifiType: Int
    var seventhcText: String
    var pmeteroUserId: Int
    var cadenceZuopId: Int

   
    static let `default` = IalharmonComments(
        bentwohdCommId: -1,
        idartifiType:-1,
        seventhcText:"",
        pmeteroUserId:-1,
        cadenceZuopId: -1
    )
}
