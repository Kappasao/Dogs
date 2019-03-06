//
//  ViewControllerSearch.swift
//  Dogs
//
//  Created by Alvaro Salomoni on 19/02/2019.
//  Copyright © 2019 Alvaro Salomoni. All rights reserved.
//

import UIKit

class ViewControllerSearch: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    var filteredDogs:[Dogs] = [Dogs]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var searching:Bool = false
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if searching == true{
            return filteredDogs.count
        }else{
            return dogs.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.allowsSelection = false
        
        let myCellSearch = tableView.dequeueReusableCell(withIdentifier: "myCellSearch", for: indexPath) as! TableViewCellSearcherCustom
        
        if searching == true {
            myCellSearch.lblSearch.text = filteredDogs[indexPath.row].name
            let a = filteredDogs[indexPath.row].image
            if a == "null" {
                myCellSearch.imgSearch.image = UIImage(named: "pug")
            }
            else{
                tools.getImage(imagenURL: filteredDogs[indexPath.row].image) { (imgRecovered) -> Void in
                    
                    if let imagen = imgRecovered{
                        DispatchQueue.main.async {
                            myCellSearch.imgSearch.image = imagen
                            return
                        }
                    }
                }
                
            }
            myCellSearch.isLikedSearch.isHidden = filteredDogs[indexPath.row].isLiked ? false : true
        }
            
        else{
            myCellSearch.lblSearch.text = dogs[indexPath.row].name
            let a = dogs[indexPath.row].image
            if a == "null" {
                myCellSearch.imgSearch.image = UIImage(named: "pug")
            }
            else{
                tools.getImage(imagenURL: dogs[indexPath.row].image) { (imgRecovered) -> Void in
                    
                    if let imagen = imgRecovered{
                        DispatchQueue.main.async {
                            myCellSearch.imgSearch.image = imagen
                            return
                        }
                    }
                }
                
            }
            myCellSearch.isLikedSearch.isHidden = dogs[indexPath.row].isLiked ? false : true
            
        }
        return myCellSearch
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        //Esto deberia ir dentro del filter pero me peta si lo hago:
        /* || $0.country.lowercased().contains(searchText.lowercased()) == true
         */
        filteredDogs = dogs.filter({$0.name.lowercased().contains(searchText.lowercased()) == true || $0.country.lowercased().contains(searchText.lowercased()) == true})
        //filteredDogs = dogs.filter({$0.country.lowercased().contains(searchText.lowercased())})
        searching = searchText != "" ? true : false
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let isLiked = likedCategory(indexPath:indexPath)
        return UISwipeActionsConfiguration(actions: [isLiked])
        
    }
    
    
    func likedCategory(indexPath:IndexPath) -> UIContextualAction{
        
        //defino la acción que voy a devolver en el método para el array de acciones
        let action = UIContextualAction(style: .normal, title: "Like") { (action, view, completion)  in
            dogs[indexPath.row].isLiked = !dogs[indexPath.row].isLiked
            self.tableView.reloadRows(at: [indexPath], with: .none)
            
            completion(true)
        }
        
        if searching == true{
            action.title = filteredDogs[indexPath.row].isLiked ? "Why would you dislike a dog? :<" : "Like!"
            action.backgroundColor =  filteredDogs[indexPath.row].isLiked ? UIColor.gray : UIColor.red
            
        }else{
            action.title = dogs[indexPath.row].isLiked ? "Why would you dislike a dog? :<" : "Like!"
            action.backgroundColor =  dogs[indexPath.row].isLiked ? UIColor.gray : UIColor.red
            
        }
        
        tableView.reloadData()
        //finalmente una vez configurada la acción la retorno
        return action
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewControllerSearch.dismissKeyboard))
        
        //Descomentar, si el tap no debe interferir o cancelar otras acciones
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        //Las vistas y toda la jerarquía renuncia a responder, para esconder el teclado
        view.endEditing(true)
    }
    

}
