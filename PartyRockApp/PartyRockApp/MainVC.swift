//
//  ViewController.swift
//  PartyRockApp
//
//  Created by New on 1/13/17.
//  Copyright © 2017 HSI. All rights reserved.
//

import UIKit


//When working with tableview You need: UITableviewDelegate & UITableviewData Source
class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //Starts the array The () initializes it

    var partyRocks = [PartyRock]()


    @IBOutlet weak var tableview: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        //This does several things
        //First Creates a new instance of the Party Rock Class. It will look for imageURL, VideoURL, and videoTitle that is in the class

        //Then we call it from specific url and information so that will come from the same place all the time. 

        let p1 = PartyRock(imageURL: "https://yt3.ggpht.com/-isuhTXPcuUA/AAAAAAAAAAI/AAAAAAAAAAA/ZLK_0KyKOIc/s88-c-k-no-mo-rj-c0xffffff/photo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/ev4bY1SkZLg\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Lights Out")

        let p2 = PartyRock(imageURL: "https://i.ytimg.com/vi/diiGjyLrxaI/hqdefault.jpg?custom=true&w=246&h=138&stc=true&jpg444=true&jpgq=90&sp=68&sigh=xtKJZhXFH8ayT0v1OTuZ3_to16Y", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/diiGjyLrxaI\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Let's Get Ridiculous")

        let p3 = PartyRock(imageURL: "https://yt3.ggpht.com/-isuhTXPcuUA/AAAAAAAAAAI/AAAAAAAAAAA/ZLK_0KyKOIc/s88-c-k-no-mo-rj-c0xffffff/photo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/tWyuglGCKgE\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Juicy Wiggle")

        let p4 = PartyRock(imageURL: "https://yt3.ggpht.com/-qBg2o1nV4U0/AAAAAAAAAAI/AAAAAAAAAAA/h_lLmmmifI4/s88-c-k-no-mo-rj-c0xffffff/photo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/rZgIYvFu-FQ\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Kia Soul Commerical")

        let p5 = PartyRock(imageURL: "https://yt3.ggpht.com/-isuhTXPcuUA/AAAAAAAAAAI/AAAAAAAAAAA/ZLK_0KyKOIc/s88-c-k-no-mo-rj-c0xffffff/photo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/vg_nvEGryA4\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Juicy WIggle Lessons")


        //Adds "P1" to the array partyRocks so that the information will be displayed.
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)


        //Tells the app that the data comes from this page
        tableview.delegate = self
        tableview.dataSource = self
    }

    //CELL Data Manipulation. At the minimum we need these functions to tell the cells what to do with the data and how many cells to return


    //Places the data in the cell and recycles
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        //Guarantees cells are returned or new ones are created for all data that goes in. 
        if let cell = tableview.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {


            //Everytime we grab a new cell, index path.row grabs the new item needed.
            let partyRock = partyRocks[indexPath.row]

            //Updates with new data into party rock.
            cell.updateUI(partyRock: partyRock)

            return cell

        } else{
            //tries to make sure we bring something back
            return UITableViewCell()
        }

    }


    //States the number of row in the section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        //Returns the number of items in partyRocks array
        return partyRocks.count
    }

    //Review what this is and what does it mean.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]

        //performs the segue. This will not work without the Identifier being placed labeled.
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let destination = segue.destination as? VideoVC {
            if let party = sender as? PartyRock {
                destination.partyRock = party

            }
        }
    }
}

