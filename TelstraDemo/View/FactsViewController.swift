//
//  FactsViewController.swift
//  TelstraDemo
//
//  Created by Monika Jadhav on 05/05/20.
//  Copyright © 2020 rp00612313. All rights reserved.
//

import UIKit

class FactsViewController: UITableViewController {
    
    // MARK: - Variables
    var factsViewModel = FactsViewModel()
    var activityIndicator = UIActivityIndicatorView()
    
    //MARK: - View lifecycle method
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpUI()
        getFactsDataFromURL()
    }
    
    //MARK: - Method for UI setup
    func setUpUI() {
        
        activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
        activityIndicator.center =  CGPoint(x: self.view.bounds.midX, y: self.view.bounds.midY)
        activityIndicator.hidesWhenStopped = true
        tableView.addSubview(activityIndicator)
        view.backgroundColor = backgroundViewColor
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        tableView.refreshControl = refreshControl
        
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = backgroundViewColor
        self.tableView.tableFooterView = UIView()
        
        self.navigationController?.navigationBar.barTintColor = UIColor.red
        tableView.register(FactsTableViewCell.self, forCellReuseIdentifier: kCellIdentifier)
    }
    
    //MARK: - Call to get all data server
    func getFactsDataFromURL() {
        activityIndicator.startAnimating()
        factsViewModel.fetchFactsData() {
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.title = self.factsViewModel.getTitleForView()
                self.tableView.reloadData()
            }
        }
    }
    
    //MARK: - Pull to refresh method
    @objc func pullToRefresh(refreshControl: UIRefreshControl) {
        tableView.reloadData()
        getFactsDataFromURL()
        refreshControl.endRefreshing()
    }
    
}

//MARK: - UITableview Delegate and DataSource Methods

extension FactsViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return factsViewModel.getNumberOfFacts(section: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellIdentifier, for: indexPath) as! FactsTableViewCell
        cell.titleLabel.text = factsViewModel.getCellTitleText(indexPath: indexPath)
        cell.descriptionLabel.text = factsViewModel.getCellDescription(indexPath: indexPath)
        cell.titleImageView.downloaded(from: factsViewModel.getImageURL(indexPath: indexPath))
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


