//
//  ViewController.swift
//  NewsApp
//
//  Created by Sukru Kahraman on 15.11.2021.
//

import UIKit
import NewsAPI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        sendSourceRequest()
//        sendHeadlinesRequest()
    }
    
    func sendSourceRequest() {
        let request = SourceRequest()
        let requestModel = SourceRequestModel()
        request.parameters = requestModel
        NewsService.send(request: request, response: SourceResponseModel.self) { (response, error) in
            
        }
        
    }
    
    func sendHeadlinesRequest() {
        let request = HeadlineRequest()
        let requestModel = HeadlineRequestModel()
        requestModel.sources = "abc-news"
        request.parameters = requestModel
        NewsService.send(request: request, response: HeadlineResponseModel.self) { (response, error) in
            
        }
    }


}

