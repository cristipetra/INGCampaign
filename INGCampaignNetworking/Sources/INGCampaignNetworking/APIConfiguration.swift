//
//  APIConfiguration.swift
//  INGCampaignNetworking
//
//  Created by Cristian Petra on 03.06.26.
//
import Foundation

public struct APIConfiguration: Sendable {
    public let baseURL: URL
    
    public init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    public static let development = APIConfiguration(baseURL: URL(string: "https://api.npoint.io/")!)
    public static let production  = APIConfiguration(baseURL: URL(string: "https://api.npoint.io/")!)
}

public extension APIConfiguration {
    func url(for endpoint: APIEndpoint) -> URL {
        baseURL.appendingPathComponent(endpoint.path)
    }
}

public enum APIError: Error {
    case invalidURL
    case invalidResponse
    case statusCode(Int)
    case decoding(Error)
}
