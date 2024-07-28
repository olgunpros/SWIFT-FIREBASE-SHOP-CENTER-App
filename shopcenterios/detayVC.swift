import UIKit
import Firebase
import FirebaseStorage
import FirebaseFirestore

class detayVC: UIViewController {
    @IBOutlet var priceText: UILabel!
    @IBOutlet var nameText: UILabel!
    @IBOutlet var imageView: UIImageView!

    var selectedUrunAdi: String?
    var selectedFiyat: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let urunAdi = selectedUrunAdi {
            nameText.text = urunAdi
        }
        if let fiyat = selectedFiyat {
            priceText.text = fiyat
        }
    }
    
    @IBAction func bagClicked(_ sender: Any) {
        let storage = Storage.storage()
        let firestoreDatabase = Firestore.firestore()
        var firestorereference: DocumentReference? = nil
        let firestorepost = ["urunadi": self.nameText.text!, "fiyat": self.priceText.text!] as [String : Any]
        firestorereference = firestoreDatabase.collection("Sepetim").addDocument(data: firestorepost, completion: { error in
            if error != nil {
                print("Error")
            } else {
                self.performSegue(withIdentifier: "toeklendiVC", sender: nil)
            }
        })
    }
}
