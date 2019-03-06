//
//  ViewControllerProfile.swift
//  Dogs
//
//  Created by Alvaro Salomoni on 26/02/2019.
//  Copyright © 2019 Alvaro Salomoni. All rights reserved.
//

import UIKit

class ViewControllerProfile: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return likeds.count
    }
    
    override func viewDidAppear(_ animated: Bool) {
        likeds = dogs.filter({$0.isLiked==true})
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CollectionViewCellProfileCustom
        
        let a = likeds[indexPath.row].image
        if a == "null" {
            myCell.imgProfile.image = UIImage(named: "pug")
        }
        else{
            tools.getImage(imagenURL: likeds[indexPath.row].image) { (imgRecovered) -> Void in
                
                if let imagen = imgRecovered{
                    DispatchQueue.main.async {
                        myCell.imgProfile.image = imagen
                        return
                    }
                }
            }
            
        }
        
        return myCell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var collectionView:UICollectionView!
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
