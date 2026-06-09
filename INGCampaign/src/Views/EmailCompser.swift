//
//  EmailCompser.swift
//  INGCampaign
//
//  Created by Cristian Petra on 09.06.26.
//

import UIKit

struct EmailComposer {

    static func compose(
        to recipient: String,
        subject: String,
        body: String
    ) {
        var components = URLComponents()
        components.scheme = "mailto"
        components.path = recipient
        components.queryItems = [
            URLQueryItem(name: "subject", value: subject),
            URLQueryItem(name: "body", value: body)
        ]

        guard let url = components.url else {
            return
        }

        UIApplication.shared.open(url)
    }
}
