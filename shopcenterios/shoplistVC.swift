//
//  shoplistVC.swift
//  shopcenterios
//
//  Created by Olgun ‏‏‎‏‏‎ on 28.07.2024.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseFirestore

class shoplistVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet var totalText: UILabel!
    @IBOutlet var tableView: UITableView!
    
    var urunadiArray = [String]()
    var fiyatArray = [String]()
    var totalfiyat : Double = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getdataFromFirestore()

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urunadiArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "digercell", for: indexPath) as! uruncell
        cell.adText.text = urunadiArray[indexPath.row]
        cell.priceText.text = fiyatArray[indexPath.row]
        return cell
    }
    @IBAction func buyClicked(_ sender: Any) {
        self.makeAlert(text: "This is demo Project :)")
    }
    func makeAlert(text : String) {
        let alert = UIAlertController(title: "Error", message: text, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        
    }
    func getdataFromFirestore() {
        let firestoreDatabase = Firestore.firestore()
        firestoreDatabase.collection("Siparislerim").addSnapshotListener { snapshot,error in
                if error != nil {
                    print(error?.localizedDescription)
                }
                else {
                    if snapshot?.isEmpty != true {
                        for document in snapshot!.documents {
                            let documentID = document.documentID
                            if let ad = document.get("urunadi") as? String {
                                self.urunadiArray.append(ad)
                            }
                            if let fiyat = document.get("fiyat") as? String, let fiyatDouble = Double(fiyat) {
                                self.fiyatArray.append(fiyat)
                                self.totalfiyat += fiyatDouble
                            }
                            
                        }
                        self.totalText.text = "Total: \(String(format: "%.2f", self.totalfiyat))"
                        self.tableView.reloadData()

                    }
                }
                
                
                
            }
                
            
            
            
        }
        
        
        
        
    }
    



