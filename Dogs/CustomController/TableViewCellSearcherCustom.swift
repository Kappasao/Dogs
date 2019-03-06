//
//  TableViewCellSearcherCustom.swift
//  Dogs
//
//  Created by Alvaro Salomoni on 19/02/2019.
//  Copyright © 2019 Alvaro Salomoni. All rights reserved.
//

import UIKit

class TableViewCellSearcherCustom: UITableViewCell {
    
    @IBOutlet weak var isLikedSearch: UIImageView!
    @IBOutlet weak var imgSearch: UIImageView!
    @IBOutlet weak var lblSearch: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
