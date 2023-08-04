//
//  HTTPMethod.swift
//  GoPizza
//
//  Created by Rafael Rocha on 03/08/23.
//

import Foundation

enum HTTPMethod: String {
    case post
    case put
    case `get`
    case delete
    case path

    public var name: String {
        return rawValue.uppercased()
    }
}
