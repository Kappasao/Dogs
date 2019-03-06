//
//  ViewControllerDetail.swift
//  Dogs
//
//  Created by Alvaro Salomoni on 22/01/2019.
//  Copyright © 2019 Alvaro Salomoni. All rights reserved.
//

import UIKit

class ViewControllerDetail: UIViewController {
    
    @IBOutlet weak var imgCat: UIImageView!
    @IBOutlet weak var lblCat: UILabel!
    
    var titol:String = ""
    var img:UIImage = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblCat.text = titol
        imgCat.image = img
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
