//
//  ViewController.swift
//  WEINVEST
//
//  Created by Madhu on 31/08/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

//MARK: UICollectionView Datasource & Delegate Methods

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let news = WINetworkManager.sharedInstance.getNews() {
            return news.data.count
        }
        else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as? NewsCollectionViewCell
        
        if let news = WINetworkManager.sharedInstance.getNews(){
            let newsItem = news.data[indexPath.item]
            if let publisher = newsItem.publisher{
                cell?.titleLbl.text = "\(publisher) October 05, 2019"
            }
            
            if let title = newsItem.title{
                cell?.contentLbl.text = title
            }
            
            if let securities = newsItem.securities{
                cell?.symbolLbl.text = securities.symbol
                cell?.priceLbl.text = "\(securities.price)"
                cell?.changeLbl.text = "\(securities.change)"
                cell?.changePercentageLbl.text = "\(securities.percentChange)"
            }
        }
        return cell!
    }
}

//MARK: UITableView Datasource & Delegate Methods

extension HomeViewController : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let user =  WINetworkManager.sharedInstance.getUser(), let activities = user.clients.first?.activity {
            return activities.count
        }
        else {
            return 0
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClientActivityTableViewCell", for: indexPath) as? ClientActivityTableViewCell
        
        if let user =  WINetworkManager.sharedInstance.getUser(), let activities = user.clients.first?.activity, activities.count > 0 {
            let activity = activities[indexPath.row]
            
            if let tag = activity.tag {
                cell?.tagLbl.text = tag
                cell?.setTagBackground(tag: tag)
            }
            
            if let client = user.clients.first, let name = client.name {
                let accNo = client.accountNo
                cell?.cNameLbl.text = name
                cell?.acNolbl.text = "\(accNo)"
            }
            
            let price = activity.price
            cell?.gainNumberLbl.text = "\(price)"
            cell?.dateLbl.text = "Oct 11"
            
            let notificationCount = activity.notificationCount
            cell?.NotificationLbl.text = "\(notificationCount)+"
            
            //Check for whether it is last cell or not
            if (cell?.separateLineView != nil ) {
                if (activities.count - 1 == indexPath.row) {
                    cell?.separateLineView.isHidden = true
                }
                else {
                    cell?.separateLineView.isHidden = false
                }
            }
        }
        return cell!
    }
}

class HomeViewController: UIViewController {
    
    //MARK: Outlets
    
    //UIView
    
    @IBOutlet weak var revenueContainerView: UIView!
    @IBOutlet weak var targetRevenueContainerView: UIView!
    @IBOutlet weak var clientsActivitiesContainerView: UIView!
    @IBOutlet weak var clientHeaderBulbContainerView: UIView!
    @IBOutlet weak var clientHeaderFilterConterinerView: UIView!
    @IBOutlet weak var clientActivityListContainerView: UIView!
    @IBOutlet weak var HeaderView: UIView!
    
    //UITextField
    
    @IBOutlet weak var searchBar: UITextField!
    
    //UIImageView
    
    @IBOutlet weak var profileImg: UIImageView!
    
    //UITableView
    
    @IBOutlet weak var tableView: UITableView!
    
    //NSLayoutConstraint
    
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    
    
    //MARK: ViewLifeCycle
    
    //DidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        print(WINetworkManager.sharedInstance.getNews() ?? "")
        //        print(WINetworkManager.sharedInstance.getUser() ?? "")
    }
    
    //WillAppear()
    override func viewWillAppear(_ animated: Bool) {
        self.setupUI()
    }
    
    override func viewWillLayoutSubviews() {
        super.updateViewConstraints()
        self.tableViewHeightConstraint?.constant = self.tableView.contentSize.height
    }
    
    //MARK: Helper Methods
    
    func setupUI()  {
        
        self.tableView.sizeToFit()
        
        // search bar UI setup
        let value = UIColor.hexStringToUIColor(hex: "#DCDCDC")
        self.searchBar.attributedPlaceholder = NSAttributedString(string: "Search...",
                                                                  attributes: [NSAttributedString.Key.foregroundColor: value])
        
        // profile set corner radius
        self.profileImg.layer.cornerRadius = 19
        
        
        // UI style set border color
        self.revenueContainerView.layer.borderColor = UIColor.hexStringToUIColor(hex: "#EDEDED").cgColor
        
        // UI style for clientsActivitiesContainerView
        self.clientsActivitiesContainerView.layer.borderColor = UIColor.hexStringToUIColor(hex: "#EDEDED").cgColor
        self.clientActivityListContainerView.layer.borderColor = UIColor.hexStringToUIColor(hex: "#EDEDED").cgColor
        self.clientHeaderBulbContainerView.layer.borderColor = UIColor.hexStringToUIColor(hex: "#D9DDE9").cgColor
        self.clientHeaderFilterConterinerView.layer.borderColor = UIColor.hexStringToUIColor(hex: "#D9DDE9").cgColor
        
        //UI style setup for targetRevenueContainerView
        self.targetRevenueContainerView.layer.borderWidth = 1
        self.targetRevenueContainerView.layer.borderColor = UIColor.hexStringToUIColor(hex: "#EAEDF4").cgColor
    }
    
    func navigateToDetailsScreen(){
        let topUpStoryBoard  =  UIStoryboard.init(name: "Main", bundle: nil)
        let detailViewController  = topUpStoryBoard.instantiateViewController(withIdentifier: "DetailsScreen")
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    //MARK: Actions
    
    @IBAction func seeMoreBtnOnClick(_ sender: Any) {
        self.navigateToDetailsScreen()
    }
}
