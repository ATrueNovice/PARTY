//
//  PartyRock.swift
//  PartyRockApp
//
//  Created by New on 1/13/17.
//  Copyright © 2017 HSI. All rights reserved.
//

import Foundation

class PartyRock {

    //Private variables cannot be manipulated by any other code outside of this class
    private var _imageURL: String!
    private var _videoURL: String!
    private var _videoTitle: String!

    //Sets Getters to get the URL
    var imageURL: String {
        return _imageURL
    }

    var videoURL: String {
        return _videoURL
    }

    var videoTitle: String {
        return _videoTitle
        }

    //Initializes everything
    init(imageURL: String, videoURL: String, videoTitle: String) {
        _imageURL = imageURL
        _videoURL = videoURL
        _videoTitle = videoTitle
    }
}
