//
//  PartyCell.swift
//  PartyRockApp
//
//  Created by New on 1/13/17.
//  Copyright © 2017 HSI. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    //The outlet that changes the Preview Image for each video
    @IBOutlet weak var videoPreviewImage: UIImageView!

    //Changes the title of the preview
    @IBOutlet weak var videoTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    //Changes the image from the url. This function calls from the model group, via encapsulation, 
    func updateUI(partyRock: PartyRock) {
        videoTitle.text = partyRock.videoTitle

        //Place on an Asychronous thread. If it is syncrhonus, it will take long and be more data
        //Gets images the "!" at the end unwraps it.
        //party rock is called from the Party Rock model in the model folder. It is only available because of the UpdateUI function that connects the party cell view to the Party Rock. The ".imageURL" is a method in the Party Rock.Swift file.

        let url = URL(string: partyRock.imageURL)!

        //Asynchronous thread that is created. Calls the thread in the back ground so it doesn't hold up the app.
        DispatchQueue.global().async {
            do {
                //Tries to get data
                let data = try Data(contentsOf: url)

                //Updates main thread where user will see
                DispatchQueue.global().sync {
                    //Says the video preview image should be referred to here as (self) and it will get it's data from "data"
                    self.videoPreviewImage.image = UIImage(data: data)
                }
                //ERROR handling
            }catch {
        }
    }


}
}
