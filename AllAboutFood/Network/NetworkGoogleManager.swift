//
//  NetworkGoogleManager.swift
//  AllAboutFood
//
//  Created by Apiux on 23-09-23.
//

import Foundation

final class NetworkGoogleManager {
    let network: Network

    init(network: Network) {
        self.network = network
    }

    func getImageThumbnailURL(this quantity: Int, from search: String?, _ completion: @escaping ([URL]) -> Void) {
        getURL(this: quantity, from: search) { response in
            guard let url = response?.items.compactMap({$0.image.thumbnailLink}) else { return }
            completion(url)
        }
    }
    
    func getImageURL(this quantity: Int, from search: String?, _ completion: @escaping ([URL]) -> Void) {
        getURL(this: quantity, from: search) { response in
            guard let urls = response?.items.compactMap({$0.link}) else { return }
            completion(urls)
        }
    }

    private func getURL(this quantity: Int, from search: String?, _ completion: @escaping (ImageQuery?) -> Void) {
        let encodedString = search?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "invalid%2C%20image%2C%20icon"
        let urlString = Endpoints.GoogleCustomSearchApi.apiImagesGoogle(with: encodedString, and: quantity)
        network.fetchWithAlamofire(with: urlString, method: .get) { (response: ImageQuery?) in
            completion(response)
        }
    }
}
