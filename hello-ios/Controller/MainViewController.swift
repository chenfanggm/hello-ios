import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON

class MainViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    
    var randomDiceIndex1: Int = 0
    var randomDiceIndex2: Int = 0
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad();
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateDiceFaces()
    }
    
    @IBAction func rollButtonPressed(_ sender: Any) {
        updateDiceFaces()
    }
    
    @IBAction func gotoNextViewButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "gotoNextView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "gotoNextView") {
            let destVC = segue.destination as! SecondViewController
            destVC.textPassover = "Hello Chen"
        }
    }
    
    func updateDiceFaces() {
        randomDiceIndex1 = Int.random(in: 0 ... 5)
        randomDiceIndex2 = Int.random(in: 0 ... 5)
        
        diceImageView1.image = UIImage(named: "dice2")
        
        ProgressHUD.showSuccess()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        statusLabel.text = "available"
        let location = locations[locations.count - 1]
        if location.horizontalAccuracy > 0 {
            locationManager.stopUpdatingLocation()
            locationManager.delegate = nil
            
            let longitude = String(location.coordinate.longitude)
            let latitude = String(location.coordinate.latitude)
            print("longitude = \(longitude), latiue = \(latitude)")
            
            let params : [String : String] = ["lon": longitude, "lat": latitude]
            
            getHttpData(url: "http://localhost:3000/health", params: params)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        statusLabel.text = "unavailable"
    }
    
    func getHttpData (url: String, params: [String: String]) {
        Alamofire.request(url, method: .get, parameters: params)
            .responseJSON(completionHandler: {
                response in
                if (response.result.isSuccess) {
                    let result : JSON = JSON(response.result.value!)
                    print(result)
                    self.statusLabel.text = "Success making request!"
                } else {
                    print("Error in request \(String(describing: response.result.error))")
                    self.statusLabel.text = "Failed making request!"
                }
            } )
    }
}

