import UIKit
import Firebase
import FirebaseStorage
import FirebaseFirestore

class urunVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var nameText: UILabel!
    var urunadiArray = [String]()
    @IBOutlet var priceText: UILabel!
    var fiyatArray = [String]()
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getDataFromFirestore()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urunadiArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! urunlercell
        cell.adTextt.text = urunadiArray[indexPath.row]
        cell.fiyatTextt.text = fiyatArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetayVC", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetayVC" {
            if let indexPath = sender as? IndexPath {
                let destinationVC = segue.destination as! detayVC
                destinationVC.selectedUrunAdi = urunadiArray[indexPath.row]
                destinationVC.selectedFiyat = fiyatArray[indexPath.row]
            }
        }
    }
    
    func getDataFromFirestore() {
        let firestoreDatabase = Firestore.firestore()
        firestoreDatabase.collection("Urunler").addSnapshotListener { snapshot, error in
            if error != nil {
                print(error?.localizedDescription ?? "Error fetching data")
            } else {
                if snapshot?.isEmpty == false && snapshot != nil {
                    self.urunadiArray.removeAll(keepingCapacity: false)
                    self.fiyatArray.removeAll(keepingCapacity: false)
                    
                    for document in snapshot!.documents {
                        let documentID = document.documentID
                        if let ad = document.get("urunadi") as? String {
                            self.urunadiArray.append(ad)
                        }
                        if let fiyat = document.get("fiyat") as? String {
                            self.fiyatArray.append(fiyat)
                        }
                    }
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    @IBAction func baggClicked(_ sender: Any) {
        let storage = Storage.storage()
        let firestoreDatabase = Firestore.firestore()
        var firestorereference: DocumentReference? = nil
        let firestorepost = ["urunadi": self.nameText.text!, "fiyat": self.priceText.text!] as [String: Any]
        firestorereference = firestoreDatabase.collection("Sepetim").addDocument(data: firestorepost, completion: { error in
            if error != nil {
                print("Error")
            } else {
                self.performSegue(withIdentifier: "toeklendiVC", sender: nil)
            }
        })
    }
}
