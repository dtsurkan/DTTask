//
//  APIWorker.swift
//  DTTask
//
//  Created by Dima Tsurkan on 9/1/17.
//  Copyright © 2017 Dima Tsurkan. All rights reserved.
//

import Foundation
import Moya

class APIWorker {
    
    func fetchPostBy(id: Int, completionHandler: @escaping ( (Post?) -> Void) ) {
        let provider = MoyaProvider<TypicodeAPI>()
        provider.request(.postBy(id: id)) { result in
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                let decoder = JSONDecoder()
                let post = try? decoder.decode(Post.self, from: data)
                completionHandler(post)
            case let .failure(error):
                debugPrint(error)
                completionHandler(nil)
            }
        }
    }
    
}
