//
//  NetworkGoogleApiManager.swift
//  AllAboutFood
//
//  Created by Apiux on 23-09-23.
//

import Foundation

final class NetworkGoogleApiManager {
    let network: Network

    init(network: Network) {
        self.network = network
    }

    func getImageThumbnailURL(this quantity: Int, from search: String?, _ completion: @escaping ([URL]) -> Void) {
        getURL(this: quantity, from: search) { response in
            switch response {
            case .success(data: let data):
                guard let url = data?.items.compactMap({$0.image.thumbnailLink}) else { return }
                completion(url)
            default: break
            }
        }
    }
    
    func getImageURL(this quantity: Int, from search: String?, _ completion: @escaping ([URL]) -> Void) {
        getURL(this: quantity, from: search) { response in
            switch response {
            case .success(data: let data):
                guard let urls = data?.items.compactMap({$0.link}) else { return }
                completion(urls)
            default: break
            }
        }
    }

    private func getURL(this quantity: Int, from search: String?, _ completion: @escaping (CaseResult<ImageQuery?, ErrorResponse>) -> Void) {
        let encodedString = search?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "invalid%2C%20image%2C%20icon"
        let urlString = Endpoints.GoogleCustomSearchApi.apiImagesGoogle(with: encodedString, and: quantity)
        network.fetchWithAlamofire(with: urlString, method: .get, parameters: "") { (response: CaseResult<ImageQuery?, ErrorResponse>) in
            completion(response)
        }
    }
}
