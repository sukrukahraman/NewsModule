//
//  NetworkRequest.swift
//  NewsAPI
//
//  Created by Sukru Kahraman on 16.11.2021.
//

import Alamofire
import Utility
import SVProgressHUD

public final class NetworkRequest {
    public static let shared = NetworkRequest()
    
    public func execute<M: Codable>(requestRoute: BaseRequest,
                                    responseModel: M.Type,
                                    completion: @escaping (Swift.Result<M, NetworkError>) -> Void) {

        
        if requestRoute.showLoading {
//            SVProgressHUD.show()
        }

        do {
            let urlRequest = try requestRoute.asURLRequest() //router için oluşturulmuş URLRequest
            Alamofire.request(urlRequest).validate().responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)
                        let jsonResults = try JSONDecoder().decode(responseModel, from: jsonData)
//                        SVProgressHUD.dismiss {
                            completion(.success(jsonResults))
//                        }
                    } catch {
//                        SVProgressHUD.dismiss {
                            completion(.failure(.parseError))
//                        }
                    }
                    break
                case .failure:
//                    SVProgressHUD.dismiss {
                        completion(.failure(.badRequestError))
//                    }
                }
            }
        } catch {
//            SVProgressHUD.dismiss {
                completion(.failure(.badUrlError))
//            }
        }
    }
}
