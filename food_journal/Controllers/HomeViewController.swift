//
//  ViewController.swift
//  food_journal
//
//  Created by Dawn Apple on 2022-11-08.
//

import UIKit

class HomeViewController: UITableViewController{

    @IBOutlet weak var search_text: UITextField!
    
    let itemArray = ["Chicken  Biryani", "Pasta", "Turkey Bolognese"]
    
    let image = ["chbiryani","pasta", "turkey"];
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK - TableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        cell.imageView?.image = UIImage(named: image[indexPath.row])
        return cell
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

