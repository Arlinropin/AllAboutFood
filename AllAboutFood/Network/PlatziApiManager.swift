//
//  PlatziApiManager.swift
//  AllAboutFood
//
//  Created by Apiux on 26-09-23.
//

import Simple_Networking

final class PlatziApiManager {
    let network: Network

    init(network: Network) {
        self.network = network
    }
    
    private func post<R: Codable, T: Codable, S: Codable>(
        _ url: String,
        _ parameter: R,
        _ completion: @escaping (CaseResult<T, S>) -> Void) {
        SN.post(endpoint: url, model: parameter) { (response: SNResultWithEntity<T, S>) in
            switch response {
            case .success(response: let response):
                completion(.success(data: response))
            case .errorResult(entity: let entity):
                completion(.error(error: .api(entity)))
            case .error(error: _):
                self.network.fetchWithAlamofire(with: url, parameters: parameter, completion: completion)
            }
        }
    }
    private func get<T: Codable, S: Codable>(
        _ url: String,
        _ completion: @escaping (CaseResult<T, S>) -> Void) {
        SN.get(endpoint: url) { (response: SNResultWithEntity<T, S>) in
            switch response {
            case .success(response: let response):
                completion(.success(data: response))
            case .errorResult(entity: let entity):
                completion(.error(error: .api(entity)))
            case .error(error: _):
                self.network.fetchWithAlamofire(with: url, parameters: "", completion: completion)
            }
        }
    }
    private func delete<T: Codable, S: Codable>(
        _ url: String,
        _ completion: @escaping (CaseResult<T, S>) -> Void) {
        SN.delete(endpoint: url) { (response: SNResultWithEntity<T, S>) in
            switch response {
            case .success(response: let response):
                completion(.success(data: response))
            case .errorResult(entity: let entity):
                completion(.error(error: .api(entity)))
            case .error(error: _):
                self.network.fetchWithAlamofire(with: url, parameters: "", completion: completion)
            }
        }
    }

    func auth(with parameter: LoginRequest, completion: @escaping (CaseResult<UserResponse, ErrorResponse>) -> Void ) {
        let url = Endpoints.PlatziApi.auth
        post(url, parameter) { (response: CaseResult<UserResponse, ErrorResponse> ) in
            if case .success(data: let data) = response, let token = data.token {
                SimpleNetworking.setAuthenticationHeader(prefix: "", token: token)
            }
            completion(response)
        }
    }

    func register(with parameter: RegisterRequest, completion: @escaping (CaseResult<UserResponse,ErrorResponse>) -> Void ) {
        let url = Endpoints.PlatziApi.register
        post(url, parameter) { (response: CaseResult<UserResponse, ErrorResponse> ) in
            if case .success(data: let data) = response, let token = data.token {
                SimpleNetworking.setAuthenticationHeader(prefix: "", token: token)
            }
            completion(response)
        }
    }

    func getPosts(completion: @escaping (CaseResult<[Tweet],ErrorResponse>) -> Void ) {
        let url = Endpoints.PlatziApi.posts
        get(url, completion)
    }

    func post(with parameter: PostRequest, completion: @escaping (CaseResult<Tweet,ErrorResponse>) -> Void ) {
        let url = Endpoints.PlatziApi.posts
        post(url, parameter, completion)
    }

    func deletePost(with parameter: String, completion: @escaping (CaseResult<DeleteResponse,ErrorResponse>) -> Void ) {
        let url = Endpoints.PlatziApi.deletePost(id: parameter)
        delete(url, completion)
    }
}
