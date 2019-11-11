//
//  ViewController.swift
//  Contacts
//
//  Created by Sergey on 10.11.2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func deleteContact(_ sender: Any) {
        texts.remove(at:indexDidSelected)
        numbers.remove(at: indexDidSelected)
        tableView.reloadData()
    }
    
    var indexDidSelected = 0
    var texts = ["Ive"]
    var numbers = ["89999999999"]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "enterName" else {return}
        
        let enterNameVC = segue.destination as! EnterNameVC
        enterNameVC.delegate = self
    }
}

extension ViewController: UITableViewDataSource{
    //func numberOfSections(in tableView: UITableView) -> Int {
    //    return 10
    //}

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return texts.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "textCell")
            as! TextTableViewCell
        let text = texts[indexPath.row]
        cell.setup(with: text)
        let textNumber = numbers[indexPath.row]
        cell.setupNumber(with: textNumber)
        return cell
    }
    
}
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexDidSelected = indexPath.row
    }
}
extension ViewController: TextDrawable {
    
    func showText(_ text: String?) {
        texts.append(text!)
    }
    func showTextNumber(_ text: String?){
        numbers.append(text!)
    }
}
