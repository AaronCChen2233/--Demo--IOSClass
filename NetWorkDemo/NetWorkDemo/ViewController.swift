//
//  ViewController.swift
//  NetWorkDemo
//
//  Created by Aaron Chen on 2020-05-14.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit

extension URL{
    func withQueries(_ queries:[String:String])->URL?{
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map{URLQueryItem(name: $0.0, value: $0.1)}
        return components?.url
    }
}

struct Photoinfo: Codable {
    var title:String
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case description = "explanation"
    }
}

class ViewController: UIViewController {
    @IBOutlet var titleLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPhotoInfo(completion: {(info) in
            DispatchQueue.main.async {
                self.titleLable.text = info.title
            }
        })
    }

    func fetchPhotoInfo(completion: @escaping (Photoinfo)->Void) {
        /**1. Url*/
        let url = URL(string: "https://api.nasa.gov/planetary/apod")!
        let queries = ["date":"2005-2-22", "api_key": "DEMO_KEY"]
        let urlWithQueries = url.withQueries(queries)!
        
        /**2. URLSession data task*/
        let task = URLSession.shared.dataTask(with: urlWithQueries){
            (data, response, error) in
            if let data = data{
                if let photoinfo = try?JSONDecoder().decode(Photoinfo.self, from: data){
                    completion(photoinfo)
                }
            }
        }
        
        /**3. Resume*/
        task.resume()
    }
}

