//
//  DetailViewController.swift
//  WEINVEST
//
//  Created by Madhu on 03/09/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: Actions
    
    @IBAction func backBtnOnClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
