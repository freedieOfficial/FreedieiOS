//
//  MunchiesVC.swift
//  Freedie Prototype
//
//  Created by montserratloan on 4/1/18.
//  Copyright © 2018 Freedie. All rights reserved.
//

import UIKit

class MunchiesVC: UIViewController {

    @IBOutlet weak var foodTypeLabel: UILabel!
    @IBOutlet weak var logoView: UIImageView!
    
    var currentPage = 0
    var foodType = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
foodTypeLabel.text = foodType[currentPage]
        
    }

}
