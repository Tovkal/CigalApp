//
//  ViewController.swift
//  CigalApp
//
//  Created by Andrés Pizá Bückmann on 21/02/2019.
//  Copyright © 2019 Andrés Pizá Bückmann. All rights reserved.
//

import UIKit
import AVKit

private enum File: String {
    case loharas, atras, mentis
}

class ViewController: UIViewController {

    @IBOutlet private var atrasSwitch: UISwitch!

    private var player: AVAudioPlayer?

    @IBAction func didTapLoHaras() {
        playFile(.loharas)
    }

    @IBAction func didTapAtras() {
        playFile(.atras)
    }

    @IBAction func didTapMentis() {
        playFile(.mentis)
    }

    private func playFile(_ file: File) {
        guard let url = Bundle.main.url(forResource: file.rawValue, withExtension: "mp3") else {
            fatalError("Audio file not found \(file.rawValue)")
        }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            player?.play()
        } catch {
            fatalError()
        }
    }

    override func becomeFirstResponder() -> Bool {
        return true
    }

    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake, atrasSwitch.isOn {
            playFile(.atras)
        }
    }
}
