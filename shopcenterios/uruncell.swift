//
//  uruncell.swift
//  shopcenterios
//
//  Created by Olgun ‏‏‎‏‏‎ on 28.07.2024.
//

import UIKit

class uruncell: UITableViewCell {

    @IBOutlet var priceText: UILabel!
    @IBOutlet var adText: UILabel!
    @IBOutlet var urunVieww: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
