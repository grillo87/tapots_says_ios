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
    
    
    @IBOutlet weak var BlueCircle: CircleDrawer!
    @IBOutlet weak var YellowCircle: CircleDrawer!
    @IBOutlet weak var GreenCircle: CircleDrawer!
    @IBOutlet weak var RedCircle: CircleDrawer!
    @IBOutlet weak var TopPlayersCollectionView: UICollectionView!
    weak var loadingDialog : LoadingViewController!
    weak var alertDialog : AlertViewController!
    
    private var sortedPlayers: [Players] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadingDialog = Utils.showLoadingDialog(viewController: self, message: "Obteniendo jugadores")
        getTopPlayers()
        setBlueCircle()
        setRedCircle()
        setYellowCircle()
        setGreenCircle()
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
                
                self.sortedPlayers = Utils.sortPlayers(players: players!)
                self.TopPlayersCollectionView.reloadSections(IndexSet(integer: 0))
                self.loadingDialog.removeAnimate()
                
                
            } else {
                
                self.loadingDialog.removeAnimate()
                self.alertDialog = Utils.showAlertDialog(viewController : self, message : "Ha ocurrido un error, intente nuevamente")
                
            }
            
            
            
            
            
        }
        
        
    }
    
    
    private func setBlueCircle() {
        
        BlueCircle.setBackground(background: UIColor(named: "blueDoots")!)
        BlueCircle.setStartAngle(startAngle: 0)
        BlueCircle.setEndAngle(endAngle: 25)
        BlueCircle.setQuaterPosition(quaterPosition: GameConstants.BLUE_VALUE)
        
        bounceBlueCircle()
        
    }
    
    private func setRedCircle() {
        
        RedCircle.setBackground(background: UIColor(named: "redDoots")!)
        RedCircle.setStartAngle(startAngle: 25)
        RedCircle.setEndAngle(endAngle: 50)
        RedCircle.setQuaterPosition(quaterPosition:GameConstants.RED_VALUE)
        
    }
    
    private func setYellowCircle() {
        
        YellowCircle.setBackground(background: UIColor(named: "yellowDoots")!)
        YellowCircle.setStartAngle(startAngle: 50)
        YellowCircle.setEndAngle(endAngle: 75)
        YellowCircle.setQuaterPosition(quaterPosition:GameConstants.YELLOW_VALUE)
        
    }
    
    private func setGreenCircle() {
        
        GreenCircle.setBackground(background: UIColor(named: "greenDoots")!)
        GreenCircle.setStartAngle(startAngle: 75)
        GreenCircle.setEndAngle(endAngle: 100)
        GreenCircle.setQuaterPosition(quaterPosition:GameConstants.GREEN_VALUE)
        
    }
    
    
    
    private func bounceBlueCircle() {
        
        self.BlueCircle.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.4,
                       initialSpringVelocity: 0.1,
                       options: .allowUserInteraction,
                       animations: { [weak self] in
                        self?.BlueCircle.transform = .identity
            },
                       completion: { _ in
                        
                        self.bounceRedCircle()
                        
        })
        
    }
    
    private func bounceRedCircle() {
        
        self.RedCircle.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.4,
                       initialSpringVelocity: 0.1,
                       options: .allowUserInteraction,
                       animations: { [weak self] in
                        self?.RedCircle.transform = .identity
            },
                       completion: { _ in
                        
                        self.bounceYellowCircle()
                        
                        
        })
        
    }
    
    
    private func bounceGreenCircle() {
        
        self.GreenCircle.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.4,
                       initialSpringVelocity: 0.1,
                       options: .allowUserInteraction,
                       animations: { [weak self] in
                        self?.GreenCircle.transform = .identity
            },
                       completion: { _ in
                        
                        self.bounceBlueCircle()
                        
                        
        })
        
    }
    
    private func bounceYellowCircle() {
        
        self.YellowCircle.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        UIView.animate(withDuration: 1.5,
                       delay: 0,
                       usingSpringWithDamping: 0.4,
                       initialSpringVelocity: 0.1,
                       options: .allowUserInteraction,
                       animations: { [weak self] in
                        self?.YellowCircle.transform = .identity
            },
                       completion: { _ in
                        
                        self.bounceGreenCircle()
                        
                        
        })
        
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
