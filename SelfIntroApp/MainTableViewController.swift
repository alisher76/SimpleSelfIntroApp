//
//  MainTableViewController.swift
//  SelfIntroApp
//
//  Created by Alisher Abdukarimov on 5/9/17.
//  Copyright © 2017 MrAliGorithm. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    
    var infoList = ["Interests", "Hometown", "Languages spoken", "Favorite televison show", "Mad😀Lib"]
    var images = ["Interests", "Town", "Languages",  "Shows", "Mad😀Lib"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return infoList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CustomTableViewCell
        cell.descriptionLabel?.text = infoList[indexPath.row]
        cell.thumbnailImageView?.image = UIImage(named: images[indexPath.row])
        cell.thumbnailImageView?.layer.cornerRadius = 20.0
        cell.thumbnailImageView.clipsToBounds = true

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailView" {
            if let indexPath = tableView.indexPathForSelectedRow {
            let destionation = segue.destination as! DetailViewController
            destionation.cellImage = images[indexPath.row]
            }
        }
    }
 

}
