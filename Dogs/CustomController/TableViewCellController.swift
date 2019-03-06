//
//  TableViewCellController.swift
//  Dogs
//
//  Created by Alvaro Salomoni on 22/01/2019.
//  Copyright © 2019 Alvaro Salomoni. All rights reserved.
//

import UIKit

class TableViewCellController: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
