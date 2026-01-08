struct DroptunChats: Codable {
    var fbeworpChatId: Int
    var loseishUsers: [Int]

   
    static let `default` = DroptunChats(
        fbeworpChatId: -1,
        loseishUsers:[]
    )
}
