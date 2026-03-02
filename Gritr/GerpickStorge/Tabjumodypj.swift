import Foundation
import CommonCrypto

extension String {

    
    private static let tabjumodypj = "ln4z2lxuujl0q7yk"
    private static let lrumvexity = "e7r4s2f3kca52b3p"
    
  
    private static let spleapink = "seq3en71ele5emoe"
    private static let artwaveneri  = "bou12eglis53al2e"

  
    func zoventraclo() -> String {
        guard let jefrombin = self.data(using: .utf8),
              let hiplomax = String.tabjumodypj.data(using: .utf8),
              let dremux = String.lrumvexity.data(using: .utf8) else { return "" }

        let cflen = size_t(jefrombin.count + kCCBlockSizeAES128)
        var cloData = Data(count: cflen)
        var nBytes: size_t = 0

        let sts = cloData.withUnsafeMutableBytes { cloBytes in
            jefrombin.withUnsafeBytes { jBytes in
                hiplomax.withUnsafeBytes { hBytes in
                    dremux.withUnsafeBytes { dBytes in
                        CCCrypt(
                            CCOperation(kCCEncrypt),
                            CCAlgorithm(kCCAlgorithmAES),
                            CCOptions(kCCOptionPKCS7Padding),
                            hBytes.baseAddress, kCCKeySizeAES128,
                            dBytes.baseAddress,
                            jBytes.baseAddress, jefrombin.count,
                            cloBytes.baseAddress, cflen,
                            &nBytes
                        )
                    }
                }
            }
        }

        guard sts == kCCSuccess else { return "" }

        cloData.removeSubrange(nBytes..<cloData.count)
        return cloData.map { String(format: "%02x", $0) }.joined()
    }

   
    func tibravoclo() -> String {
       
        guard let dataBin = Self.hexToData(self) else { return "" }

      
        if let decrypted = Self.decrypt(dataBin, key: Self.spleapink, iv: Self.artwaveneri) {
            return decrypted
        }

       
        if let decrypted = Self.decrypt(dataBin, key: Self.tabjumodypj, iv: Self.lrumvexity) {
            return decrypted
        }

        return ""
    }
}


private extension String {

    // Hex → Data
    static func hexToData(_ hex: String) -> Data? {
        guard hex.count % 2 == 0 else { return nil }

        var data = Data()
        var hexStr = hex

        while hexStr.count > 0 {
            let c = hexStr.prefix(2)
            hexStr = String(hexStr.dropFirst(2))
            guard let byte = UInt8(c, radix: 16) else { return nil }
            data.append(byte)
        }
        return data
    }

   
    static func decrypt(_ dataBin: Data, key: String, iv: String) -> String? {
        guard let keyData = key.data(using: .utf8),
              let ivData  = iv.data(using: .utf8) else { return nil }

        let cflen = size_t(dataBin.count + kCCBlockSizeAES128)
        var cloData = Data(count: cflen)
        var nBytes: size_t = 0

        let sts = cloData.withUnsafeMutableBytes { cloBytes in
            dataBin.withUnsafeBytes { dBytes in
                keyData.withUnsafeBytes { kBytes in
                    ivData.withUnsafeBytes { ivBytes in
                        CCCrypt(
                            CCOperation(kCCDecrypt),
                            CCAlgorithm(kCCAlgorithmAES),
                            CCOptions(kCCOptionPKCS7Padding),
                            kBytes.baseAddress, kCCKeySizeAES128,
                            ivBytes.baseAddress,
                            dBytes.baseAddress, dataBin.count,
                            cloBytes.baseAddress, cflen,
                            &nBytes
                        )
                    }
                }
            }
        }

        guard sts == kCCSuccess else { return nil }

        cloData.removeSubrange(nBytes..<cloData.count)
        return String(data: cloData, encoding: .utf8)
    }
}
