//
//  LIFE IS SHORT AND YOU DESERVE TO BE HAPPY.
//  ANYTHING ONE MAN CAN IMAGEINE, OTHER MEN CAN MAKE REAL. JUST DO IT!
//  YOU HAVE TO BELIEVE IN YOURSELF. THAT'S THE SECRET OF SUCCESS.
//
//
//  Created by luoqiang on 16/4/26.
//  Copyright © 2016年 CodeTeam. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var datasorce = [
        
        video(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        video(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        video(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
        video(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
        video(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
        video(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")
        
    ]
    
    @IBAction func play(sender: AnyObject) {
        
        let path = NSBundle.mainBundle().pathForResource("emoji zone", ofType: "mp4")
        let url = NSURL(fileURLWithPath: path!)
        player = AVPlayer(URL: url)
        playViewController.player = player
        
        self.presentViewController(playViewController, animated: true, completion: {
            self.playViewController.player?.play()
        })
    }
    
    
    
    var playViewController = AVPlayerViewController()
    var player:AVPlayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasorce.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 220
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("VideoCell", forIndexPath: indexPath) as! VideoCell
        
        let video = datasorce[indexPath.row]
        cell.videoScreenshot?.image = UIImage(named: video.image)
        cell.videoTitleLabel.text = video.title
        cell.videoSourceLabel.text = video.source
        
        return cell
    }


}
