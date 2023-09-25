//
//  NetworkFoodApiManager.swift
//  AllAboutFood
//
//  Created by Apiux on 23-09-23.
//

final class NetworkFoodApiManager {
    let network: Network
    let numberOfFood = 25

    init(network: Network) {
        self.network = network
    }

    func getList(page number: Int, _ completion: @escaping ([Food]) -> Void) {
        let url = ConstantsURLs.FoodApi.list(with: numberOfFood, and: number)
        network.fetchWithSession(with: url) { (response: [Food]?) in
            completion( response ?? [] )
        }
    }
    func search(this text: String, page number: Int, _ completion: @escaping ([Food]) -> Void) {
        let url = ConstantsURLs.FoodApi.search(this: text, with: numberOfFood, and: number)
        network.fetchWithSession(with: url) { (response: [Food]?) in
            completion( response ?? [] )
        }
    }
}
