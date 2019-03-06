//
//  TabBarControllerCustom.swift
//  Dogs
//
//  Created by Alvaro Salomoni on 22/01/2019.
//  Copyright © 2019 Alvaro Salomoni. All rights reserved.
//

import UIKit

class TabBarControllerCustom: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Configuracion de los colores de los elementos del tabbar
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.darkGray], for: .normal)
        
        //Configuracion de los items del tab bat, personalizando selected y normal
        
        //Seleccionamos el primer elemento del tabbar
        tabBarItem = self.tabBar.items![0]
        //Asignamos la imagen al elemento sin seleccionar
        tabBarItem.image = UIImage(named: "dog")?.withRenderingMode(.alwaysOriginal)
        
        // Y al seleccionado
        tabBarItem.selectedImage = UIImage(named: "selDog")?.withRenderingMode(.alwaysOriginal)
        
        tabBarItem = self.tabBar.items![1]
        //Asignamos la imagen al elemento sin seleccionar
        tabBarItem.image = UIImage(named: "guitar")?.withRenderingMode(.alwaysOriginal)
        // Y al seleccionado
        tabBarItem.selectedImage = UIImage(named: "blackGuitar")?.withRenderingMode(.alwaysOriginal)
        
        tabBarItem = self.tabBar.items![2]
        //Asignamos la imagen al elemento sin seleccionar
        tabBarItem.image = UIImage(named: "user")?.withRenderingMode(.alwaysOriginal)
        // Y al seleccionado
        tabBarItem.selectedImage = UIImage(named: "blackUser")?.withRenderingMode(.alwaysOriginal)
        
        tabBarItem = self.tabBar.items![3]
        //Asignamos la imagen al elemento sin seleccionar
        tabBarItem.image = UIImage(named: "about")?.withRenderingMode(.alwaysOriginal)
        // Y al seleccionado
        tabBarItem.selectedImage = UIImage(named: "aboutSel")?.withRenderingMode(.alwaysOriginal)
        
        

        //Este bucle es para que en todos los elementos del tab bar, salgan con una posicion exacta
 
        for index in 0...(tabBar.items!.count - 1){
            tabBarItem = self.tabBar.items![index]
            
            tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -30, right: 0);
            
        }
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
