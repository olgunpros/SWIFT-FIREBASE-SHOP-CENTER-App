//
//  urunlercell.swift
//  shopcenterios
//
//  Created by Olgun ‏‏‎‏‏‎ on 28.07.2024.
//

import UIKit

class urunlercell: UITableViewCell {
    @IBOutlet var urunlerView: UIImageView!
    
    @IBOutlet var fiyatTextt: UILabel!
    @IBOutlet var adTextt: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func bagClicked(_ sender: Any) {
    }
    
}
