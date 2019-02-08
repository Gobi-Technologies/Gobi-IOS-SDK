//
//  ViewController.swift
//  GobiSDK
//
//  Created by savilov on 02/07/2019.
//  Copyright (c) 2019 Gobitech. All rights reserved.
//

import UIKit

import GobiSDK

struct Stories {
    static var gobiTeamStoryId = "<YOUR_STORY_KEY>"
}

class ViewController: UIViewController {
    
    fileprivate let storyKey = Stories.gobiTeamStoryId
    fileprivate let customerId = "<YOUR_CUSTOMER_ID>"
    
    fileprivate var story: GobiStory?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImageView()
        Gobi.with(customerId, delegate: self)
        reloadStory()
    }
    
    @IBAction func showStory(_ sender: Any) {
        guard let story = story else {
            return
        }
        if story.unreadCount > 0 {
            Gobi.showStory(with: storyKey, from: self)
        } else {
            Gobi.rewindStory(with: storyKey, from: self)
        }
    }
    
    @IBAction func reload(_ sender: Any) {
        reloadStory()
    }
    
}

extension ViewController: GobiDelegate {
    
    func didReceiveStory(_ story: GobiStory) {
        self.story = story
        titleLabel.text = story.title
        loadThumbnailImage(for: story)
    }
    
    func didFailWith(_ error: GobiError) {
        showAlert(with: "Error", message: error.errorDescription)
    }
    
    func didFinishShowingMedia() {
        reloadStory()
    }
    
}

extension ViewController {
    
    func setupImageView() {
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = UIColor(white: 0.95, alpha: 1)
    }
    
    func reloadStory() {
        Gobi.getStoryData(for: storyKey)
    }
    
    func loadThumbnailImage(for story: GobiStory) {
        if story.unreadCount > 0 {
            imageView.image = nil
            imageView.contentMode = .scaleAspectFill
            DispatchQueue.global(qos: .background).async {
                if let thumbnail = story.thumbnail, let url = URL(string: thumbnail), let data = try? Data(contentsOf: url) {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        self.imageView.image = image
                    }
                }
            }
        } else {
            imageView.contentMode = .center
            imageView.image = UIImage(named: "rewind")
        }
    }
    
    func showAlert(with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}