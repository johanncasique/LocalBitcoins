//
//  WebService.swift
//  LocalBitcoin
//
//  Created by johann on 29/01/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import Foundation
import CommonCrypto
import CryptoSwift

extension Data {
    struct HexEncodingOptions: OptionSet {
        let rawValue: Int
        static let upperCase = HexEncodingOptions(rawValue: 1 << 0)
    }
    
    func hexEncodedString(options: HexEncodingOptions = []) -> String {
        let format = options.contains(.upperCase) ? "%02hhX" : "%02hhx"
        return map { String(format: format, $0) }.joined()
    }
}

extension Date {
    func toMillis() -> Int64 {
        return Int64(timeIntervalSince1970 * 1000)
    }
}

enum CryptoAlgorithm {
    case MD5, SHA1, SHA224, SHA256, SHA384, SHA512
    
    var HMACAlgorithm: CCHmacAlgorithm {
        var result: Int = 0
        switch self {
        case .MD5:      result = kCCHmacAlgMD5
        case .SHA1:     result = kCCHmacAlgSHA1
        case .SHA224:   result = kCCHmacAlgSHA224
        case .SHA256:   result = kCCHmacAlgSHA256
        case .SHA384:   result = kCCHmacAlgSHA384
        case .SHA512:   result = kCCHmacAlgSHA512
        }
        return CCHmacAlgorithm(result)
    }
    
    var digestLength: Int {
        var result: Int32 = 0
        switch self {
        case .MD5:      result = CC_MD5_DIGEST_LENGTH
        case .SHA1:     result = CC_SHA1_DIGEST_LENGTH
        case .SHA224:   result = CC_SHA224_DIGEST_LENGTH
        case .SHA256:   result = CC_SHA256_DIGEST_LENGTH
        case .SHA384:   result = CC_SHA384_DIGEST_LENGTH
        case .SHA512:   result = CC_SHA512_DIGEST_LENGTH
        }
        return Int(result)
    }
}

extension String {
    
    func hmac(algorithm: CryptoAlgorithm, key: String) -> String {
        let str = self.cString(using: String.Encoding.utf8)
        let strLen = Int(self.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = algorithm.digestLength
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        let keyStr = key.cString(using: String.Encoding.utf8)
        let keyLen = Int(key.lengthOfBytes(using: String.Encoding.utf8))
        
        CCHmac(algorithm.HMACAlgorithm, keyStr!, keyLen, str!, strLen, result)
        
        let digest = stringFromResult(result: result, length: digestLen)
        
        return digest
    }
    
    private func stringFromResult(result: UnsafeMutablePointer<CUnsignedChar>, length: Int) -> String {
        let hash = NSMutableString()
        for i in 0..<length {
            hash.appendFormat("%02x", result[i])
        }
        return String(hash).uppercased()
    }
}

class WebService: WebServiceProtocol {
    
    func getData(urlString: String, completion: @escaping (WebServiceTypeDataResult) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidUrl))
            return
        }
        
        let baseUrl = "https://localbitcoins.com"
        let endpoint = "/api/myself/"
        let contactEndpoint = "/api/account_info/ELEXGARAY"
        let recentMessage = "/api/recent_messages/"
        
        
        //let now = Date()
        let nonce = Date().toMillis()
        let hmacAuthKey = "5e38f8f943ebd582447fb61a3e828bf7"
        let secret = "ab1482d40ae144ac129d05049757ff6d48171a1159d4d2c4c80155012d3b500b"
        
        
        let message = String(nonce) + hmacAuthKey + endpoint
        
        let signature = message.hmac(algorithm: .SHA256, key: secret)
        
        let headers = ["Apiauth-key" : hmacAuthKey,
                       "Apiauth-Nonce" : String(nonce),
                       "Apiauth-Signature" : signature]
        let urll = URL(string: "\(baseUrl)\(recentMessage)")
        var request = URLRequest(url: urll!)
        request.setValue(hmacAuthKey, forHTTPHeaderField: "Apiauth-key")
        request.setValue(String(nonce), forHTTPHeaderField: "Apiauth-Nonce")
        request.setValue(signature, forHTTPHeaderField: "Apiauth-Signature")
        
        URLSession.shared.dataTask(with: request) { (data, responer, error) in
            print(data)
            let stringData = String(data: data!, encoding: .utf8)
            print(stringData)
            print(responer)
            print(error)
        }.resume()

        
//        '1551522241766'
//        '277DD6FD6CF6C54488026AEA97D2D18A532CE0CB9C44170A4A920AAC6944D3B7'
//        '5e38f8f943ebd582447fb61a3e828bf7'
        
//        DispatchQueue.global(qos: .background).async {
//            URLSession.shared.dataTask(with: url) { (data, response, error) in
//
//                DispatchQueue.main.async {
//                    guard error == nil else {
//
//                        completion(.failure(.networkError(error!)))
//                        return
//                    }
//                    guard let data = data else {
//                        completion(.failure(.noData))
//                        return
//                    }
//                    completion(.sucess(data))
//                }
//
//                }.resume()
//        }
        
        
    }
}
