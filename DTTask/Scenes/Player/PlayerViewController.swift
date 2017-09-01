//
//  PlayerViewController.swift
//  DTTask
//
//  Created by Dima Tsurkan on 9/1/17.
//  Copyright (c) 2017 Dima Tsurkan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import AVFoundation
import AVKit
import MediaPlayer

protocol PlayerDisplayLogic: class {
    func displayVideoPlayer(viewModel: Player.FetchVideo.ViewModel)
}

class PlayerViewController: UIViewController, PlayerDisplayLogic {
    var interactor: PlayerBusinessLogic?
    var router: (NSObjectProtocol & PlayerRoutingLogic & PlayerDataPassing)?
    var displayedVideo: Player.FetchVideo.ViewModel.DisplayedVideo?
    
    // MARK: Object lifecycle
  
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
  
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
  
    // MARK: Setup
  
    private func setup() {
        let viewController = self
        let interactor = PlayerInteractor()
        let presenter = PlayerPresenter()
        let router = PlayerRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
  
    // MARK: Routing
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
  
    // MARK: View lifecycle
  
    override func viewDidLoad() {
        super.viewDidLoad()
        requestVideoPlaying()
        
        let worker = APIWorker()
        worker.fetchPostBy(id: 1) { (post) in
            if let post = post {
                print(post)
            }
        }
    }
  
    // MARK: Play Video
  
    func requestVideoPlaying() {
        let request = Player.FetchVideo.Request()
        interactor?.playVideo(request: request)
    }
  
    func displayVideoPlayer(viewModel: Player.FetchVideo.ViewModel) {
        displayedVideo = viewModel.displayedVideo
        play()
    }
    
    func play() {
        let player = AVPlayer(url: (displayedVideo?.videoURL)!)
        let playerController = AVPlayerViewController()
        playerController.player = player
        self.present(playerController, animated: true) {
            player.play()
        }
    }
}