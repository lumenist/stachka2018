//
//  AlamofireTransport.swift
//  stachka2018
//
//  Copyright © 2018 *. All rights reserved.
//

import Foundation
import Alamofire


final class AlamofireTransport {
    
    // MARK: - Propeties
    
    private let sessionManager: SessionManager
    
    
    // MARK: - Init
//    Part I — Pinning
//    init() {
//        let serverTrustPolicies: [String: ServerTrustPolicy] = [
//            "api.github.com": .pinPublicKeys(
//                publicKeys: AlamofireTransport.savedPublicKeys(),
//                validateCertificateChain: true,
//                validateHost: true
//            )]
//
//        let serverTrustPolicyManager = ServerTrustPolicyManager(policies: serverTrustPolicies)
//
//        sessionManager = SessionManager(
//            configuration: URLSessionConfiguration.default,
//            serverTrustPolicyManager: serverTrustPolicyManager)
//    }
    
    init() {
        sessionManager = SessionManager(
            configuration: URLSessionConfiguration.default,
            serverTrustPolicyManager: nil)
    }
    
    
    // MARK: - Public methods
    
    func obtainProfile(name: String, completion: (() -> ())?) {
        let urlString = "https://api.github.com/users/\(name)"
        
        sessionManager.request(urlString, method: .get, parameters: nil, encoding: JSONEncoding.default)
            .responseJSON { response in
                print(response.result.value as Any)
                completion?()
        }
    }
    
    
    // MARK: - Private methods
    
    private static func savedPublicKeys() -> [SecKey]    {
        let publicKeys = ServerTrustPolicy.publicKeys(in: Bundle.main)
        return publicKeys
    }
    
}
