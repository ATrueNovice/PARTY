//
//  VideoVC.swift
//  PartyRockApp
//
//  Created by New on 1/13/17.
//  Copyright © 2017 HSI. All rights reserved.
//

import UIKit

class VideoVC: UIViewController {

    //Allows you to put things from the web into your app.
    @IBOutlet weak var webView: UIWebView!

    @IBOutlet weak var titleLbl: UILabel!

    @IBOutlet weak var backbtn: UIButton!

    //
    private var  _partyRock: PartyRock!


    //Getter and setter
    var partyRock: PartyRock {
        get {
            return _partyRock
        } set{
            _partyRock = newValue
        }
    }

    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    // Initialize the segue
    override func viewDidLoad() {
        super.viewDidLoad()

        // Sends the title of the youtube video to the next page. partyRock( References the private var) and videoTitle is in the PartyRock file and gets and sets the name.
        titleLbl.text = partyRock.videoTitle

        //sends the url to the next page to play.
        webView.loadHTMLString(partyRock.videoURL, baseURL: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
