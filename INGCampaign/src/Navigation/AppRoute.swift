//
//  AppRoute.swift
//  INGCampaign
//
//  Created by Cristian Petra on 04.06.26.
//
import SwiftUI
import INGCampaignModels
internal import Combine


protocol AppRouterProtocol {
    func navigate(to route: CampaignRoute)
}

enum AppRoute: Hashable {
    case campaign(CampaignRoute)
}

enum CampaignRoute: Hashable {
    case targetSelection
    case channelList(channels: [CampaignChannel])
    case campaignSelection(channel: CampaignChannel)
    case reviewSelection
}

protocol ViewFactory {
    associatedtype V: View
    @ViewBuilder func view(container: AppDependencyContainer) -> V
}

@MainActor
class AppRouter: ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
    
    func navigate(to route: CampaignRoute) {
        path.append(route)
    }
    
    func goBack() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }

    func goToRoot() {
        path.removeLast(path.count)
    }
    
}

extension AppRouter: AppRouterProtocol {}

@MainActor
class CampaignRouter: ObservableObject, AppRouterProtocol {
    @Published public var path: [CampaignRoute] = []
    
    func navigate(to route: CampaignRoute) {
        path.append(route)
    }
    
    func goBack() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }

    func goToRoot() {
        path.removeLast(path.count)
    }
    
}
