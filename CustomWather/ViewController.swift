//
//  ViewController.swift
//  CustomWather
//
//  Created by MohammadHossein Ghadamyari on 2025-03-07.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var userlist = [String: Any]()
    @IBOutlet var tableView : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        WeatherData()
    }
    func WeatherData() {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=36.210171&lon=58.795937&appid=96694abc40fc3380990b38de95c17707")
        if url == nil {
            print("URL Invalid")
            return
        }
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url!) { data, response, error in
            if error != nil {
                print("error in reciving the data \(error!.localizedDescription)")
                return
            }
            
            if let data = data {
                if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {
                    if let main = json["main"] as? [String: Any] {
                        DispatchQueue.main.async {
                            self.userlist = main
                            self.tableView.reloadData()
                        }
                    }
                } else {
                    print("error Processing the json")
                }
            }
        }
        
        task.resume()
    }
//
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        let user = userlist
        
        let humidity = userlist["humidity"] as? Int ?? 0
        
        if let temp = userlist["temp"] as? Double {
            let tempCelsius = temp - 273.15
            let newTemp = String(format: "%.0f°C", tempCelsius)
            cell.tempLabel.text = newTemp
        }

        
        cell.humiditiLabel.text = "\(humidity)%"
       
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
        
    }
}
