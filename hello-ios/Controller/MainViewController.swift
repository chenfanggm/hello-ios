import UIKit
import CoreLocation

class MainViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
   
    var randomDiceIndex1: Int = 0;
    var randomDiceIndex2: Int = 0;
    let locationManager = CLLocationManager();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
        locationManager.requestWhenInUseAuthorization();
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateDiceFaces();
    }
    
    @IBAction func rollButtonPressed(_ sender: Any) {
        updateDiceFaces();
    }
    
    func updateDiceFaces() {
        randomDiceIndex1 = Int.random(in: 0 ... 5);
        randomDiceIndex2 = Int.random(in: 0 ... 5);
        
        diceImageView1.image = UIImage(named: "dice2");
        
        ProgressHUD.showSuccess();
    }
}

