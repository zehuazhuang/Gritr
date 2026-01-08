

struct AvelguitarPosts: Codable {
    var alternatPostId: Int
    var wnstrokeWena: String
    var prebendImg: String
    var staccatoDiz: String
    var gerstyleUserId: Int
    var harmonicLikes: [Int]

   
    static let `default` = AvelguitarPosts(
        alternatPostId: -1,
        wnstrokeWena:"",
        prebendImg:"gritr_icon",
        staccatoDiz: "",
        gerstyleUserId: 0,
        harmonicLikes:[]
    )
}
