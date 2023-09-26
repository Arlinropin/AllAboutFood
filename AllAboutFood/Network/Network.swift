//
//  Network.swift
//  AllAboutFood
//
//  Created by Apiux on 22-09-23.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case unrecoverable
    case unreachable
    case unauthorized
    case temporary
    case badURL
    case noData
    case decodingError
    case notFound
    case connection
}

public enum CaseResult<T, E> {
    case success(data: T)
    case error(error: ErrorType<E>)
    case unauthorized(error: Error)
}

public enum ErrorType<E>: Error {
    case connection
    case api(_ apiError: E)
    case general(_ error: Error? = nil)
}

final class Network {
    
    let consultaQueue = DispatchQueue.global(qos: .background)
    
    func fetchWithSession<T: Decodable>(with urlString: String, completion: @escaping (T?) -> Void ) {
        consultaQueue.async {
            // 1. Create/get URL
            guard let url = URL(string: urlString) else {
                completion( nil )
                return
            }
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, _, error in
                let dataString = String(data: data ?? Data(), encoding: .utf8) ?? "Sin data"
                print("[Data]: \(dataString)")
                guard let safeData = data, error == nil,
                      let json: T = self.parseJSON(this: safeData) else {
                    completion( nil )
                    return
                }
                completion(json)
            }
            task.resume()
        }
    }

    private func parseJSON<T: Decodable>(this data: Data) -> T? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(T.self, from: data)
            return decodeData
        } catch {
            return nil
        }
    }
}

extension Network {
    func fetchWithAlamofire<T: Decodable>(with urlString: String,
                                          method: HTTPMethod = .get,
                                          parameters: Parameters = [:],
                                          completion: @escaping (T?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        AF.request(url, method: method, parameters: parameters).responseData { (response: AFDataResponse<Data>) in
            guard let safeData = response.data, response.error == nil,
                  let json: T = self.parseJSON(this: safeData) else {
                return
            }
            completion(json)
        }
    }
}
