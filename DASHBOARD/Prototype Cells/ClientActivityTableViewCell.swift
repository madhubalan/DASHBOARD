//
//  ClientActivityTableViewCell.swift
//  WEINVEST
//
//  Created by Madhu on 03/09/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class ClientActivityTableViewCell: UITableViewCell {
    
    //MARK: Outlets
    
    //UILabel
    
    @IBOutlet weak var tagLbl: UILabel!
    @IBOutlet weak var cNameLbl: UILabel!
    @IBOutlet weak var acNolbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var totalAumLbl: UILabel!
    @IBOutlet weak var gainNumberLbl: UILabel!
    @IBOutlet weak var NotificationLbl: UILabel!
    
    //UIView
    
    @IBOutlet weak var RightSegmentContainer: UIView!
    @IBOutlet weak var notificationView: UIView!
    @IBOutlet weak var separateLineView: UIView!
    @IBOutlet weak var tagLblContainerView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    //MARK: Helper Methods
    
    func setupUI(){
        self.RightSegmentContainer.layer.borderColor = UIColor.hexStringToUIColor(hex: "#D9DDE9").cgColor
        self.notificationView.layer.cornerRadius = 10
        self.notificationView.layer.masksToBounds = true
    }
    
    func setTagBackground(tag : String){
        var color = UIColor.hexStringToUIColor(hex: "#E3CD78")
        switch tag {
        case "Platinum":
            color = UIColor.hexStringToUIColor(hex: "#260B52")
            self.tagLbl.textColor = UIColor.white
        case "Silver":
            color = UIColor.hexStringToUIColor(hex: "#CACDD2")
            self.tagLbl.textColor = UIColor.hexStringToUIColor(hex: "#2E2E2E")
        default:
            color = UIColor.hexStringToUIColor(hex: "#E3CD78")
        }
        
        if ((self.tagLblContainerView) != nil){
            self.tagLblContainerView.backgroundColor = color
        }
    }
}
