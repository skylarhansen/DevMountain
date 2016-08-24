//
//  PlanetListViewController.swift
//  SolarSystem
//
//  Created by Jairo Eli de Leon on 8/16/16.
//  Copyright © 2016 Jairo Eli. All rights reserved.
//

import UIKit

class PlanetListViewController: UITableViewController {
  
  let planets = PlanetController.planets
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  // MARK: - Table view data source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return PlanetController.planets.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "planetCell", for: indexPath)
    
    let planet = PlanetController.planets[indexPath.row]
    cell.textLabel?.text = planet.name
    cell.imageView?.contentMode = .scaleAspectFill
    cell.imageView?.image = UIImage(named: planet.imageName)
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 110
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    if segue.identifier == "toPlanetDetail" {
      
      if let indexPath: IndexPath = tableView.indexPathForSelectedRow {
        let detailVC = segue.destination as? PlanetDetailViewController
        
        detailVC?.planet = planets[indexPath.row]
      }
    }
  }
  
  
}


































