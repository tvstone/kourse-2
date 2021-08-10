//
//  NetworkLayer.swift
//  MyVKclient
//
//  Created by Владислав Тихоненков on 10.08.2021.
//

import Foundation
import Alamofire

class NetworkLayer {
    
    private let scheme = "https://"
    private let host = "api.vk.com/"
    private let token = Session.shared.token
    private let id = Session.shared.userId


    func forecast() {

        let parameters: Parameters = [
            "user_id": id,
            "fields": "nickname, sex, city, country, photo_50",
            "order": "name",
            "count": "10",
            "access_token" : token,
            "v" : "5.131"
            ]
        let pathForFriends = "method/friends.get"

       
        AF.request(scheme + host + pathForFriends , method: .get, parameters: parameters).responseJSON { response in
            switch response.result {
            case .failure(let error):
                print(error)
            case .success(let json):
                print(json)
            }
        }
    }

    func forecastGroup() {

        let parameters: Parameters = [
            "user_id": id,
            "extended": "1",
            "count": "10",
            "access_token" : token,
            "v" : "5.131"
            ]
        let pathForGroups = "method/groups.get"
     
        AF.request(scheme + host + pathForGroups , method: .get, parameters: parameters).responseJSON { response in
            switch response.result {
            case .failure(let error):
                print(error)
            case .success(let json):
                print(json)
            }
        }

    }

}
