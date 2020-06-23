//
//  CategoryViewController.swift
//  CatCart
//
//  Created by Jessie Ann Griffin on 6/18/20.
//  Copyright © 2020 CatCartCo. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!

    static func goToStore() -> CategoryViewController {
        let storyboard = UIStoryboard(name: "CatsForSale", bundle: nil)
        print(storyboard)
        let categoryVC = storyboard.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
        
        categoryVC.modalPresentationStyle = .fullScreen
        
        return categoryVC
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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