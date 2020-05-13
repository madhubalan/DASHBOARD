//
//  NewsCollectionViewCell.swift
//  WEINVEST
//
//  Created by Madhu on 03/09/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    
    //MARK: Outlets
    
    //UILabel
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    @IBOutlet weak var symbolLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var changeLbl: UILabel!
    @IBOutlet weak var changePercentageLbl: UILabel!
    
    //UIView
    
    @IBOutlet weak var middleContentView: UIView!
    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }
    
    func setupUI(){
        self.bgView.layer.borderColor = UIColor.hexStringToUIColor(hex: "#D9DDE9").cgColor
        self.middleContentView.layer.borderColor = UIColor.hexStringToUIColor(hex: "#D9DDE9").cgColor
    }
}
