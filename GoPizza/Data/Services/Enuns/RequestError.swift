//
//  RequestError.swift
//  GoPizza
//
//  Created by Rafael Rocha on 01/08/23.
//

import Foundation

enum RequestError: Error {
    case error(String)
    case urlInvalid
    case noDataAvariable
    case noProcessData
}
