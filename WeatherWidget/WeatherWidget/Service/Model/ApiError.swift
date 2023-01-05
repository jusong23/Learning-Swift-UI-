//
//  ApiError.swift
//  WeatherWidget
//
//  Created by mobile on 2023/01/05.
//

import Foundation

enum ApiError: Error {
    case unknown
    case invalidUrl(String)
    case invaildResponse
    case failed(Int)
    case emptyData
}
