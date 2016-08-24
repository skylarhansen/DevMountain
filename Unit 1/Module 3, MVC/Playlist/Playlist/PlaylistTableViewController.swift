//
//  PlaylistTableViewController.swift
//  Playlist
//
//  Created by Spencer Curtis on 8/17/16.
//  Copyright © 2016 Spencer Curtis. All rights reserved.
//

import UIKit

class PlaylistTableViewController: UITableViewController {
    
    @IBOutlet weak var playlistTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tableView.reloadData()
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PlaylistController.sharedController.playlists.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("playlistCell", forIndexPath: indexPath)
        
        let playlist = PlaylistController.sharedController.playlists[indexPath.row]
        
        cell.textLabel?.text = playlist.name
        cell.detailTextLabel?.text = "\(playlist.songs.count) songs"
        
        return cell
    }
    
    @IBAction func addButtonTapped(sender: AnyObject) {
        
        if let name = playlistTextField.text where name.characters.count > 0 {
            
            PlaylistController.sharedController.addPlaylist(name)
            playlistTextField.text = ""
            self.tableView.reloadData()
        }
    }
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            let playlist = PlaylistController.sharedController.playlists[indexPath.row]
            PlaylistController.sharedController.deletePlaylist(playlist)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }    
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toPlaylistDetail", let indexPath = tableView.indexPathForSelectedRow {
            
            let playlist = PlaylistController.sharedController.playlists[indexPath.row]
            let songVC = segue.destinationViewController as? SongTableViewController
            songVC?.playlist = playlist
        }
        
        
    }
    
    
}
