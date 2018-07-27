//
//  TopPlayerCollectionViewCell.swift
//  Tapots! Says
//
//  Created by José Grillo on 18/7/18.
//  Copyright © 2018 José Grillo. All rights reserved.
//

import UIKit
import SDWebImage

public class TopPlayerCollectionViewCell : UICollectionViewCell {
    
    
    @IBOutlet weak var PlayerAvatar: UIImageView!

    @IBOutlet weak var PlayerName: UILabel!
    
    @IBOutlet weak var PlayerScore: UILabel!
    
    
    func displayData(PlayerAvatar: String, PlayerName : String, PlayerScore: Int) {
        
        self.PlayerAvatar.sd_setImage(with: URL(string: PlayerAvatar))
        self.PlayerName.text = PlayerName
        self.PlayerScore.text = "Score: \(PlayerScore)"
        
    }
    
    
}
