//
//  VideoModel.swift
//  YouTubeApp
//
//  Created by e on 4/7/18.
//  Copyright © 2018 Thizzler. All rights reserved.
//

import UIKit

class VideoModel: NSObject {
    func getVideos() -> [Video] {
        
        // Create a video object
        var videos = [Video]()
        
        //Create a video object
        let video1 = Video()
        //Aasign properties
        video1.videoId = "rCxJCRPP5L4"
        video1.videoTitle = "Leo"
        video1.videoDescription = "sldfjslkdfjlksdfjlskd"
        videos.append(video1)
        
        
        //Create a video object
        let video2 = Video()
        //Aasign properties
        video2.videoId = "4PkKuVs7U24"
        video2.videoTitle = "Let"
        video2.videoDescription = "sldfjslkdfjlksdfjlskd"
        videos.append(video2)
        
        
        //Create a video object
        let video3 = Video()
        //Aasign properties
        video3.videoId = "fboV36_Pu6U"
        video3.videoTitle = "get"
        video3.videoDescription = "sldfjslkdfjlksdfjlskd"
        videos.append(video3)
        
        //Create a video object
        let video4 = Video()
        //Aasign properties
        video4.videoId = "s0qydiXo-Bk"
        video4.videoTitle = "the"
        video4.videoDescription = "sldfjslkdfjlksdfjlskd"
        videos.append(video4)
        
        //Create a video object
        let video5 = Video()
        //Aasign properties
        video5.videoId = "k7z7y64HkOo"
        video5.videoTitle = "It's M.U.S.I.C. -OCD(Prod. 96) [Thizzler.com]"
        video5.videoDescription = "sldfjslkdfjlksdfjlskd"
        videos.append(video5)
        
        return videos
        
        //Append it into the videos array
    }
}
