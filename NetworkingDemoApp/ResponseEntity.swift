//
//  ResponseEntity.swift
//  NetworkingDemoApp
//
//  Created by ByRamon on 04/04/20.
//  Copyright © 2020 ByRamon. All rights reserved.
//
import Foundation

struct Response: Codable{
    var results: [Result]
}
struct Result: Codable{
    var trackId: Int
    var trackName: String
    var collectionName: String
}
