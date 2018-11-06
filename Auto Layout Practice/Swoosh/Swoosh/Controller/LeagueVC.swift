//
//  LeagueVCViewController.swift
//  Swoosh
//
//  Created by S M HEMEL on 4/11/18.
//  Copyright © 2018 S M HEMEL. All rights reserved.
//

import UIKit

class LeagueVC: UIViewController {
    var player: Player!
    @IBOutlet weak var nextBtn: BorderButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        player = Player()
    }
    @IBAction func nextButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "SkillVCSegue", sender: self)
    }
    @IBAction func mensButtonAction(_ sender: Any) {
        selectLeague(leagueType: "mens")
    }
    @IBAction func womensButtonAction(_ sender: Any) {
        selectLeague(leagueType: "womens")
    }
    @IBAction func coedButtonAction(_ sender: Any) {
        selectLeague(leagueType: "coed")
    }
    func selectLeague(leagueType: String){
        player.desiredLeague = leagueType
        nextBtn.isEnabled = true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let skillVC = segue.destination as? SkillVC {
            skillVC.player = player
        }
    }

}
