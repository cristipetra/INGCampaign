//
//  APIEndpoint.swift
//  INGCampaignNetworking
//
//  Created by Cristian Petra on 03.06.26.
//
import Foundation

public enum HTTPMethod: String {
    case get    = "GET"
    case post   = "POST"
    case put    = "PUT"
    case delete = "DELETE"
}

public protocol Endpoint {
    var path: String { get }
    var method: HTTPMethod { get }
    //var body: Data? { get }
}

public enum APIEndpoint: Endpoint {
    case getTargets
    case getCampaign(id: String)
    
    public var path: String {
        switch self {
        case .getTargets:
            return "b22fd39c053b256222b1"
        case .getCampaign(let id):
            return "\(id)"
        }
    }
        
    public var method: HTTPMethod {
        .get
    }
    
}

