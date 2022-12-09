//
//  Networking.swift
//  med_tracker
//
//  Created by Angel Zambrano on 12/7/22.
//

import Foundation


// MARK: - MedicineGetter
struct MedicineGetter:Codable {
    let success: Bool?
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass:Codable {
    let user_medicine: [UserMedicine]?
}

// MARK: - UserMedicine
struct UserMedicine:Codable {
    let usermed_id: Int?
    let name: String?
    let type: Int?
    let time: String?
    let days: [String: String]
}



class API {
    let shared = API()
    
    static func postRequest(username: String, password: String, completion: @escaping ([String: Any]?, Error?) -> Void) {

        //declare parameter as a dictionary which contains string as key and value combination.
        let parameters = ["email": username, "password": password]

        //create the url with NSURL
        let url = URL(string: "http://143.198.178.220:8000/api/login")!

        //create the session object
        let session = URLSession.shared

        //now create the Request object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = "POST" //set http method as POST

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to data object and set it as request body
        } catch let error {
            print(error.localizedDescription)
            completion(nil, error)
        }

        //HTTP Headers
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request, completionHandler: { data, response, error in

            guard error == nil else {
                completion(nil, error)
                return
            }

            guard let data = data else {
                completion(nil, NSError(domain: "dataNilError", code: -100001, userInfo: nil))
                return
            }

            do {
                //create json object from data
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {
                    completion(nil, NSError(domain: "invalidJSONTypeError", code: -100009, userInfo: nil))
                    return
                }
                print(json)
                completion(json, nil)
            } catch let error {
                print(error.localizedDescription)
                completion(nil, error)
            }
        })

        task.resume()
    }
    
    
   static func logIn(email: String, password: String, completion: @escaping (Result<LogIn?, Error>) -> Void) {
            guard var url  = URLComponents(string: "http://143.198.178.220:8000/api/login") else {return}
        
        let json: [String: Any] = ["email": email, "password": password]

        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        
        var request = URLRequest(url: url.url!)
        request.httpBody = jsonData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"

        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
                    
                    print(responseJSON)
                    
                    
                    
                    print(data)
                    let decoder = JSONDecoder()
                    let searchResponse = try decoder.decode(LogIn.self, from: data) // gets the artists
                    

                    completion(.success(searchResponse))
                } catch {
                    completion(.failure(error))
                }
            }
        }

        task.resume()
        
    }
    
    
    static func gettingUserMedications(completion: @escaping (Result<MedicineGetter?, Error>) -> Void) {
        guard var url  = URLComponents(string: "http://143.198.178.220:8000/medicine/create") else {return}
    
    var request = URLRequest(url: url.url!)
    
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    request.httpMethod = "GET"

    
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let error = error {
            completion(.failure(error))
        } else if let data = data {
            do {
                let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
                
                print(responseJSON)
                
                
                
                print(data)
                let decoder = JSONDecoder()
                let searchResponse = try decoder.decode(MedicineGetter.self, from: data) // gets the artists
                

                completion(.success(searchResponse))
            } catch {
                completion(.failure(error))
            }
        }
    }

    task.resume()
    }
    
    // getting the timeline

    static func gettingTimeline(completion: @escaping (Result<Timeline?, Error>) -> Void) {
        guard var url  = URLComponents(string: "http://143.198.178.220:8000/timeline/daily") else {return}
    
    var request = URLRequest(url: url.url!)
    
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    request.httpMethod = "GET"

    
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let error = error {
            completion(.failure(error))
        } else if let data = data {
            do {
                let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
                
                print(responseJSON)
                
                
                
                print(data)
                let decoder = JSONDecoder()
                let searchResponse = try decoder.decode(Timeline.self, from: data) // gets the artists
                

                completion(.success(searchResponse))
            } catch {
                completion(.failure(error))
            }
        }
    }

    task.resume()
    }
    


}
