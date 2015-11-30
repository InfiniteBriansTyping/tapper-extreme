//
//  ViewController.swift
//  tapper-extreme
//
//  Created by Brian Kress on 11/29/15.
//  Copyright © 2015 Brian Kress. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Properties
    var maxTaps: Int = 0
    var currentTaps: Int = 0
    
    
    //Outlets
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var howManyTapsTxt: UITextField!
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var tapsBtn: UIButton!
    @IBOutlet weak var tapsLbl: UILabel!
    
    //Actions
    @IBAction func onPlayBtnPressed(sender: UIButton!) {
        
        if howManyTapsTxt.text != nil && howManyTapsTxt.text != "" {
            
            logoImg.hidden = true
            playBtn.hidden = true
            howManyTapsTxt.hidden = true
            
            tapsLbl.hidden = false
            tapsBtn.hidden = false

            maxTaps = Int(howManyTapsTxt.text!)!
            currentTaps = 0
            
            updateTapsLabel()
        }
    }
    
    @IBAction func onDiamondTap(sender: UIButton!) {
        currentTaps++;
        updateTapsLabel()
        
        if isGameOver() {
            restartGame()
        }
    }
    
    func restartGame() {
        maxTaps = 0
        howManyTapsTxt.text = ""
        
        logoImg.hidden = false
        playBtn.hidden = false
        howManyTapsTxt.hidden = false
        
        tapsLbl.hidden = true
        tapsBtn.hidden = true
    }
    
    func isGameOver() -> Bool {
        if currentTaps >= maxTaps {
            return true
        }
        return false
    }
    
    func updateTapsLabel() {
        tapsLbl.text = "\(currentTaps) Taps"
    }

}

