//
//  APIClient.swift
//  INGCampaignNetworking
//
//  Created by Cristian Petra on 03.06.26.
//
import Foundation

public protocol APIClientProtocol {
    func send<T: Decodable>(endpoint: APIEndpoint) async throws -> T
}

public protocol URLSessionProtocol {
    func data(from url: URL) async throws -> (Data, URLResponse)
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol {}

public final class APIClient: APIClientProtocol {
    
    private let apiConfiguration: APIConfiguration
    private let session: URLSessionProtocol
    
    public init(apiConfiguration: APIConfiguration = .development,
                session: URLSessionProtocol = URLSession.shared) {
        self.apiConfiguration = apiConfiguration
        self.session = session
    }
    
    public func send<T: Decodable>(endpoint: APIEndpoint) async throws -> T {
        let url = apiConfiguration.baseURL.appendingPathComponent(endpoint.path)
        
        print(url)
        
        let request = URLRequest(url: url)
        
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }
        
        guard (200..<300).contains(httpResponse.statusCode) else {
            throw APIError.statusCode(httpResponse.statusCode)
        }
        
        // Decode
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw APIError.decoding(error)
        }
        
    }
}




