//
//  UnivTableViewController.swift
//  mapView
//
//  Created by SWUCOMPUTER on 11/06/2019.
//  Copyright © 2019 SWUCOMPUTER. All rights reserved.
//

import UIKit

class UnivTableViewController: UITableViewController {
    
    // 대학 정보를 저장하기 위함
    var universities: [University] = []
    // 지도가 있는 상위 View: 선택한 대학 정보를 전달해 주기 위함
    var mainVC: ViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        var univ: University
        
        univ = University(title:"서울여자대학교", latitude:37.6291, longitude:127.0897)
        self.universities.append(univ)
        univ = University(title: "고려대학교", latitude:37.5894, longitude:127.0323)
        self.universities.append(univ)
        univ = University(title: "부산대학교", latitude:35.2332, longitude:129.0794)
        self.universities.append(univ)
        univ = University(title: "Harvard University", latitude:42.36402, longitude:-71.12482)
        self.universities.append(univ)
        univ = University(title: "Michigan State Univ.", latitude:42.72401, longitude:-84.48137)
        self.universities.append(univ)
        univ = University(title: "New York University", latitude:40.7247, longitude:-73.9903)
        self.universities.append(univ)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.universities.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        self.mainVC?.selectedIndex = indexPath.row
        self.mainVC?.univ = self.universities[indexPath.row]
        self.tableView.reloadData()
        self.dismiss(animated: true, completion: nil)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Univ Cell", for: indexPath)
        // Configure the cell...
        cell.textLabel?.text = self.universities[indexPath.row].title
        if let view = self.mainVC {
            if let index = view.selectedIndex {
                if index == indexPath.row {
                    cell.accessoryType = .checkmark
                }
                else {
                    cell.accessoryType = .none
                }
            } }
        return cell }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
