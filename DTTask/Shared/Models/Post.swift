//
//  Post.swift
//  DTTask
//
//  Created by Dima Tsurkan on 9/1/17.
//  Copyright © 2017 Dima Tsurkan. All rights reserved.
//

import Foundation

struct Post: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
