//
//  ViewController.swift
//  Dogs
//
//  Created by Alvaro Salomoni on 22/01/2019.
//  Copyright © 2019 Alvaro Salomoni. All rights reserved.
//

import UIKit

var favDogs:[Dogs] = [Dogs]()
var dogs:[Dogs] = [Dogs]()
var tools:Tools = Tools()
var likeds:[Dogs] = []

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {

     @IBOutlet weak var tableView: UITableView!
     //@IBOutlet weak var likedButton: UIButton!

    //var categories:[Categoria] = [Categoria(title: "Sci.fi",image: UIImage(named: "EdUSA")!),Categoria(title: "Comedy",image: UIImage(named: "EdJP")!),Categoria(title: "Terror",image: UIImage(named: "EdGB")!)]
    //var perros:[Dog] = [Dog]()
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Elementos que va a contener la tabla
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogs.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Razas"
    }
    
    @objc func likedButton (sender:UIButton){
        if sender.image(for: .normal) == UIImage(named: "selDog"){
            sender.setImage(UIImage(named: "dog"), for: .normal)
            dogs[sender.tag].isLiked = false
            likeds.removeAll()
            likeds = dogs.filter({$0.isLiked==true})
        }else{
            sender.setImage(UIImage(named: "selDog"), for: .normal)
            dogs[sender.tag].isLiked = true
            likeds.append(Dogs(name: dogs[sender.tag].name, image: dogs[sender.tag].image, section: dogs[sender.tag].section, country: dogs[sender.tag].country))
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        //Acceso a mi celda personalizada del mainstoryboard
        let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCellController
        
        //Aqui le decimos que el texto que habra en cada celda es el titulo que hay en el arraylist de dogs
        myCell.lbl.text = dogs[indexPath.row].name

        let a = dogs[indexPath.row].image
        if a == "null" {
            myCell.img.image = UIImage(named: "pug")
        }
        else{
            tools.getImage(imagenURL: dogs[indexPath.row].image) { (imgRecovered) -> Void in
                
                if let imagen = imgRecovered{
                    DispatchQueue.main.async {
                        myCell.img.image = imagen
                        return
                    }
                }
            }
            
        }
        
        if(dogs[indexPath.row].isLiked == false){
            myCell.button.setImage(UIImage(named: "dog"), for: .normal)
        }else{
            myCell.button.setImage(UIImage(named: "selDog"), for: .normal)
        }
        
        myCell.button.tag = indexPath.row
        myCell.button.addTarget(self, action: #selector(likedButton), for: .touchUpInside)
        
        return myCell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
        likeds = dogs.filter({$0.isLiked==true})
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(dogs[indexPath.row].name)
        
        //Definir instancia de la vista que voy a enviar la info
        let viewControllerNew = storyboard?.instantiateViewController(withIdentifier: "detail") as! ViewControllerDetail
        
        //Indicarle donde va a recoger la informacion, es este caso de una URL
        let URL = NSURL(string: dogs[indexPath.row].image)
        let data = try? Data(contentsOf: URL! as URL)
        if data == nil{
            viewControllerNew.img = UIImage(named: "pug")!
        }
        else{
            viewControllerNew.img = UIImage(data: data!)!
        }
        
        viewControllerNew.titol = dogs[indexPath.row].name
        
        //Decirle a que VC le va a pasar la informacion
        self.navigationController?.pushViewController(viewControllerNew, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        self.showSpinner(onView: self.view)
        tools.parseCSVDogs(dogs: &dogs)
        self.removeSpinner()
    }
}

var vSpinner : UIView?

extension UIViewController {
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}

