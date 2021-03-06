//
//  PlayerPresenter.swift
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

protocol PlayerPresentationLogic {
    func presentVideoPlayer(response: Player.FetchVideo.Response)
}

class PlayerPresenter: PlayerPresentationLogic {
    weak var viewController: PlayerDisplayLogic?
  
    // MARK: Do something
  
    func presentVideoPlayer(response: Player.FetchVideo.Response) {
        if let url = response.videoURL {
            let displayedVideo = Player.FetchVideo.ViewModel.DisplayedVideo(videoURL: url)
            let viewModel = Player.FetchVideo.ViewModel(displayedVideo: displayedVideo)
            viewController?.displayVideoPlayer(viewModel: viewModel)
        }
    }
}
