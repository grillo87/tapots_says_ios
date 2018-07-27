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

class TopPlayersViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var TopPlayersCollectionView: UICollectionView!
    weak var loadingDialog : LoadingViewController!
    weak var alertDialog : AlertViewController!
    
    private var sortedPlayers: [Players] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadingDialog = Utils.showLoadingDialog(viewController: self, message: "Obteniendo jugadores")
        getTopPlayers()
    }
    
    private func getTopPlayers() {
        
        let decoder = JSONDecoder()
        Alamofire.request("http://private-b31630-tapotssays.apiary-mock.com/topPlayers").responseDecodableObject(decoder: decoder) { (response: DataResponse<[Players]>) in
            let players = response.result.value
            if (players != nil) {
                
                self.sortedPlayers = Utils.sortPlayers(players: players!)
                self.TopPlayersCollectionView.reloadSections(IndexSet(integer: 0))
                self.loadingDialog.removeAnimate()
                
                
            } else {
                
                self.loadingDialog.removeAnimate()
                self.alertDialog = Utils.showAlertDialog(viewController : self, message : "Ha ocurrido un error, intente nuevamente")
                
            }
            
            
            
            
            
        }
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.sortedPlayers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopPlayersCollectionView", for: indexPath) as! TopPlayerCollectionViewCell
        
        let player = sortedPlayers[indexPath.row]
        collectionViewCell.displayData(PlayerAvatar: player.avatar, PlayerName: player.name, PlayerScore: player.score)
        
        return collectionViewCell
        
        
    }
    

}
