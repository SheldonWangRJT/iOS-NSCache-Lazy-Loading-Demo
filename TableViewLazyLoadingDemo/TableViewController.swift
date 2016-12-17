//
//  TableViewController.swift
//  TableViewLazyLoadingDemo
//
//  Created by Shinkangsan on 12/16/16.
//  Copyright © 2016 Sheldon. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var itemsAry:[Item]?
    var cache = NSCache<AnyObject, AnyObject>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item = Item(name: "", img: "")
        itemsAry = item.makeItems()
        
        print(itemsAry)
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (itemsAry?.count)!
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! TableViewCell
        
        let item = itemsAry?[indexPath.row]
        cell.nameLabel.text = item?.nameStr
        
        if let img = cache.object(forKey: item?.nameStr as AnyObject) {
            cell.imgView.image = img as! UIImage
        }else {
            DispatchQueue.global().async {
                let data = NSData(contentsOf: URL(string:(item?.imageStr)!)!)
                DispatchQueue.main.async {
                    cell.imgView.image = UIImage(data: data as! Data)
                    self.cache.setObject(UIImage(data: data as! Data)!, forKey: item?.nameStr as AnyObject)
                }
            }
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
