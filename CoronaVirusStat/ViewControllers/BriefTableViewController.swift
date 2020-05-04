//
//  BriefTableViewController.swift
//  CoronaVirusStat
//
//  Created by Денис Щиголев on 09.04.2020.
//  Copyright © 2020 jedi-tones. All rights reserved.
//

import UIKit
import RealmSwift

class BriefTableViewController: UITableViewController {
    
    let jsonManager = JsonManager()
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCell()
        getBreaf()
        
        GetData.shared.briefDelegate = self
    }
    
    
    private func registerCell(){
        tableView.register(UINib(nibName: "BriefTableViewCell", bundle: nil), forCellReuseIdentifier: BriefTableViewCell.reuseID)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BriefTableViewCell.reuseID, for: indexPath) as! BriefTableViewCell
        cell.setChartUI()
        cell.setLineChartData()
        cell.setCell()
        return cell
    }
    
    //MARK:  getBreaf
    private func getBreaf(){
        GetData.shared.getBreaf()
        GetData.shared.getData()
    }
     
}

extension BriefTableViewController: UpdateBreaf {
    func updateBreafChart() {
        tableView.reloadData()
    }
}
