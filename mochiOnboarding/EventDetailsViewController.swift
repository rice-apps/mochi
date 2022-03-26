//
//  EventDetailsViewController.swift
//  mochiOnboarding
//
//  Created by Katharine Bonilla on 3/19/22.
//

import UIKit

class EventDetailsViewController: UIViewController {
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var confirmButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)

        // Do any additional setup after loading the view.
        detailsLabel.text = "Event Details"
        detailsLabel.font = UIFont(name: "Poppins-SemiBold", size: 24)
        
        var eventName = "RiceApps Work Break"
        eventLabel.text = "Event Name: " + "\(eventName)"
        eventLabel.font = UIFont(name: "Poppins-Medium", size: 18)
        
        var location = "Lilie Lab"
        locationLabel.text = "Location: " + "\(location)"
        locationLabel.font = UIFont(name: "Poppins-Medium", size: 18)
        
        var date = "Apr 16, 2022 12:30 PM"
        dateLabel.text = "When: " + "\(date)"
        dateLabel.font = UIFont(name: "Poppins-Medium", size: 18)
        
        confirmButton.setTitleColor(.white, for: .normal)
        confirmButton.layer.backgroundColor = UIColor(red: 0.486, green: 0.165, blue: 0.906, alpha: 1).cgColor
        confirmButton.layer.cornerRadius = 5
        confirmButton.tintColor = .white
        //confirmButton.setTitle("Confirm Attendance", for: .normal)
        //confirmButton.titleLabel?.font =  UIFont(name: "Poppins-SemiBold", size: 16)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
