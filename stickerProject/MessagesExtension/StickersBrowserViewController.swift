//
//  StickersBrowserViewController.swift
//  stickerProject
//
//  Created by Flatiron School on 4/26/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation
import UIKit
import Messages

class StickersBrowserViewController: MSStickerBrowserViewController {

    var stickers: [MSSticker] = []
    
    func loadStickers() {
    
        createSticker(asset: "imageName", localizedDescription: "giving it a name")
        
    }
    
    func createSticker(asset: String, localizedDescription: String){
    
        guard let stickerPath = Bundle.main.path(forResource: asset, ofType: "png") else{
            print("Couldn't create sticker path for", asset)
            return
        }
        
        let stickerURL = URL(fileURLWithPath: stickerPath)
        
        let sticker: MSSticker
        do {
            try sticker = MSSticker(contentsOfFileURL: stickerURL, localizedDescription: localizedDescription)
            self.stickers.append(sticker)
        }
        catch{
            print(error)
            return
        
        }
    }
    
    override func numberOfStickers(in stickerBrowserView: MSStickerBrowserView) -> Int {
        return self.stickers.count
    }
    
    override func stickerBrowserView(_ stickerBrowserView: MSStickerBrowserView, stickerAt index: Int) -> MSSticker {
        return self.stickers[index]
    }


}
