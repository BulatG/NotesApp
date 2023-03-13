//
//  Model.swift
//  nodeSwift
//
//  Created by Булат Габдуллин on 05.03.2023.
//

import Foundation
// файл для считывания json
var nodes = [Node]()

func readLocalFile(forName name: String) -> Data? {
    do {
        if let bundlePath = Bundle.main.path(forResource: name,
                                             ofType: "json"),
            let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
            print(jsonData)
            return jsonData
        }
    } catch {
        print(error)
    }
    
    return nil
}

//func parse(jsonData: Data) {
//    do {
//        let decodedData = try JSONDecoder().decode([Node].self, from: jsonData)
//        nodes = decodedData
//            } catch {
//                print("decode error")
//            }
//}

func loadJson(fromURLString urlString: String,
                      completion: @escaping (Result<Data, Error>) -> Void) {
    if let url = URL(string: urlString) {
        let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            if let data = data {
                completion(.success(data))
            }
        }
        
        urlSession.resume()
    }
}
