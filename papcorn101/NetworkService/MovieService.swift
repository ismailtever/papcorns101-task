//
//  MovieService.swift
//  papcorn101
//
//  Created by Ismail Tever on 24.08.2023.
//

import Foundation
import Alamofire


class Webservice {
    
    static let shared = Webservice()

    var movie = [MovieInfo]()
    var user = [UserInfo]()

    
    func fetchingAPIData(handler: @escaping (_ apiData:[MovieInfo]) -> (Void)) {
        let url = "http://www.mocky.io/v2/5dea8d843000001d442b09da"
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { response in
            switch response.result {
            case .success(let data):
                do {
                    let jsonData = try JSONDecoder().decode([MovieInfo].self, from: data!)
                    handler(jsonData)
                    print(jsonData)
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    func fetchingUserData(handler: @escaping (_ apiData:[UserInfo]) -> (Void)) {
        let url = "http://www.mocky.io/v2/5dea8bf6300000d23f2b09d0"
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { response in
            switch response.result {
            case .success(let data):
                do {
                    let jsonData = try JSONDecoder().decode([UserInfo].self, from: data!)
                    handler(jsonData)
                    print(jsonData)
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    func fetchImages(with url: String?, completion: @escaping (Data) -> Void) {
        if let urlString = url, let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    debugPrint(error)
                    return
                }
                if let data = data {
                    DispatchQueue.main.async {
                        completion(data)
                    }
                }
            }.resume()
        }
    }
}

