//
//  TopPlayersViewController.swift
//  Tapots! Says
//
//  Created by José Grillo on 11/7/18.
//  Copyright © 2018 José Grillo. All rights reserved.
//

import UIKit
import Alamofire
import CodableAlamofire

class TopPlayersViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        getTopPlayers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func getTopPlayers() {
        
        let decoder = JSONDecoder()
        Alamofire.request("http://private-b31630-tapotssays.apiary-mock.com/topPlayers").responseDecodableObject(decoder: decoder) { (response: DataResponse<[Players]>) in
            let players = response.result.value
            if (players != nil) {
                
                let sortedPlayers = Utils.sortPlayers(players: players!)
                for player in sortedPlayers {
                    print("player \(player.name), score \(player.score)")
                }
                
            } else {
                
                print("Error Web Service!")
                
            }
            
        }
        
        
    }

}
