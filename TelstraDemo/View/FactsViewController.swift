//
//  FactsViewController.swift
//  TelstraDemo
//
//  Created by Monika Jadhav on 05/05/20.
//  Copyright © 2020 rp00612313. All rights reserved.
//

import UIKit

class FactsViewController: UITableViewController {
    

 //MARK: - View lifecycle method
 override func viewDidLoad() {
     super.viewDidLoad()
     // Do any additional setup after loading the view, typically from a nib.
      setUpUI()
 }
 
 //MARK: - Method for UI setup
 func setUpUI() {
         view.backgroundColor = .white
         tableView.refreshControl = refreshControl
         tableView.separatorStyle = .none
         tableView.dataSource = self
         tableView.delegate = self
         tableView.rowHeight = UITableView.automaticDimension
         tableView.backgroundColor = UIColor.white
         self.tableView.tableFooterView = UIView()
         self.navigationController?.navigationBar.barTintColor = UIColor.lightGray
         tableView.register(FactsTableViewCell.self, forCellReuseIdentifier: kCellIdentifier)
     }
 
 

     
 //MARK: - UITableview Delegate and DataSource Methods
 
 override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
             return 1
         }
         
 override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
             let cell = tableView.dequeueReusableCell(withIdentifier: kCellIdentifier, for: indexPath) as! FactsTableViewCell
             return cell
         }
         
 override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
             return UITableView.automaticDimension
         }
 }
