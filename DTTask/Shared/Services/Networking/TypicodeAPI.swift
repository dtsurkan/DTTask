//
//  TypicodeAPI.swift
//  DTTask
//
//  Created by Dima Tsurkan on 9/1/17.
//  Copyright © 2017 Dima Tsurkan. All rights reserved.
//

import Foundation
import Moya
import Alamofire

protocol APIType {
    var addXAuth: Bool { get }
}

enum TypicodeAPI {
    case postBy(id: Int)
}

// MARK: - TargetType, BotlAPIType

extension TypicodeAPI: TargetType, APIType {
    
    public var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    public var task: Task {
        return .request
    }
    
    var path: String {
        switch self {
        case .postBy(let id):
            return "/posts/\(id)"
        
        }
    }
    
    var base: String { return "https://jsonplaceholder.typicode.com" }
    var baseURL: URL { return URL(string: base)! }
    
    var parameters: [String: Any]? {
        switch self {
        case .postBy:
            return [:]
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .postBy:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var addXAuth: Bool {
        switch self {
        case .postBy:
            return false
        }
    }
    
    var headers: [String: Any] {
        switch self {
        case .postBy:
            return [:]
        }
    }
    
}
