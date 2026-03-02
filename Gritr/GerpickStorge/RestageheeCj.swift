

import Security
import Foundation
import Combine

final class RestageheeCj {

    private static var cache: [String: String?] = [
        "zsGritrtfreezeern": nil,
        "zsGritrtctemovepk": nil,
        "zsGritrtuloordinatde": nil,
        "zsGritrteflexibilins": nil,
    ]

    private static let service = "com.yourapp.keychain"

    
    static var tfreezeern: String {
        (cache["zsGritrtfreezeern"] ?? "") ?? ""
    }
    
    static var ctemovepk: String {
        (cache["zsGritrtctemovepk"] ?? "") ?? ""
    }
    
    static var uloordinatde: String {
        (cache["zsGritrtuloordinatde"] ?? "") ?? ""
    }
    
    static var eflexibilins: String {
        (cache["zsGritrteflexibilins"] ?? "") ?? ""
    }

    private static func save(_ key: String, _ value: String) {
        cache[key] = value

        let data = value.data(using: .utf8)!

        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: key,
            kSecValueData as String: data
        ]

        SecItemDelete(query as CFDictionary)
        SecItemAdd(query as CFDictionary, nil)
    }

    static func savetfreezeern(_ v: String) {
        save("zsGritrtfreezeern", v)
    }

    static func savectemovepk(_ v: String) {
        save("zsGritrtctemovepk", v)
    }

    static func saveuloordinatde(_ v: String) {
        save("zsGritrtuloordinatde", v)
    }

    static func saveeflexibilins(_ v: String) {
        save("zsGritrteflexibilins", v)
    }




    static func initStore() {
        for key in cache.keys {
            cache[key] = read(key)
        }
    }

    private static func read(_ key: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: key,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)

        guard status == errSecSuccess,
              let data = result as? Data else {
            return nil
        }

        return String(data: data, encoding: .utf8)
    }
}
