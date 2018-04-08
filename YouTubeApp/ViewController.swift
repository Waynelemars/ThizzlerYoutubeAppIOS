//
//  ViewController.swift
//  YouTubeApp
//
//  Created by e on 4/7/18.
//  Copyright © 2018 Thizzler. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    var videos : [Video] = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.videos = VideoModel().getVideos()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        //get the width of the screen to calculate the height of the row
       return ( self.view.frame.size.width / 320 ) * 180

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell")!
        let videoTitle = videos[indexPath.row].videoTitle
        
        //Get the label for the cell
        let label = cell.viewWithTag(2) as! UILabel
        label.text = videoTitle
        
        
        
        // Customize the cell to display the video title
//        cell.textLabel?.text = videoTitle
        
        // construct the video thumbnail url
//        let videoThumbnailUrlString =  "https://i1.ytimg.com/vi/" + videos[indexPath.row].videoId + "/mqdefault.jpg"
//
//        // Create an NSURL object
//        let videoThumbnailUrl = URL(string: videoThumbnailUrlString)
//
////        let url = URL(string: "google.com"); let requestObj = URLRequest(url: url!);
//
//        if(videoThumbnailUrl != nil) {
//
//            // Create an NSURLRequst object
//            let request = URLRequest(url: videoThumbnailUrl!)
//
//            // Create an NSURLSession
//            let session = URLSession.shared
//
//
//            // Create a datatask and pass in the request
//            let datatask = session.dataTask(with: request, completionHandler:
//            { (data, response, error) in
//
//                DispatchQueue.main.async(execute: { () -> Void in
//                    // Get a referece to the imageview element of the cell
//                    let imageView = cell.viewWithTag(1) as! UIImageView
//                    // Create an image object from the data and assign it into the imageview
//                    imageView.image = UIImage(data: data!)
//                })
//
//            })
//            datatask.resume()
//        }
        
//reference
        //        https://stackoverflow.com/questions/39813497/swift-3-display-image-from-url?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa;
        
        let catPictureURL = URL(string: "https://i1.ytimg.com/vi/" + videos[indexPath.row].videoId + "/maxresdefault.jpg")!
        
        // Creating a session object with the default configuration.
        // You can read more about it here https://developer.apple.com/reference/foundation/urlsessionconfiguration
        let session = URLSession(configuration: .default)
        
        // Define a download task. The download task will download the contents of the URL as a Data object and then you can do what you wish with that data.
        let downloadPicTask = session.dataTask(with: catPictureURL) { (data, response, error) in
            // The download has finished.
            if let e = error {
                print("Error downloading cat picture: \(e)")
            } else {
                // No errors found.
                // It would be weird if we didn't have a response, so check for that too.
                if let res = response as? HTTPURLResponse {
                    print("Downloaded cat picture with response code \(res.statusCode)")
                    if let imageData = data {
                     DispatchQueue.main.async(execute: { () -> Void in
                        let imageView = cell.viewWithTag(1) as! UIImageView
                        // Finally convert that Data into an image and do what you wish with it.
                        imageView.image = UIImage(data: imageData)
                        })
                    } else {
                        print("Couldn't get image: Image is nil")
                    }
                } else {
                    print("Couldn't get response code for some reason")
                }
            }
        }
        
        downloadPicTask.resume()
        return cell
     }


}

