//
//  LibraryAPI.swift
//  BlueLibrarySwift
//
//  Created by Nathan Haley on 2/5/16.
//  Copyright © 2016 Raywenderlich. All rights reserved.
//

import UIKit

class LibraryAPI: NSObject {
    
    private let persistencyManager: PersistencyManager
    private let httpClient: HTTPClient
    private let isOnline: Bool
    
    
    class var sharedInstance: LibraryAPI {
        
        struct Singleton {
            
            static let instance = LibraryAPI()
        }
        
        return Singleton.instance
    }
    
    
    
    override init() {
    persistencyManager = PersistencyManager()
    httpClient = HTTPClient()
    isOnline = false
    
    super.init()
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "downloadImage:", name: "BLDownloadImageNotification", object: nil)
    }
    
    func getAlbums() -> [Album] {
        return persistencyManager.getAlbums()
    }
    
    func addAlbum(album: Album, index: Int) {
        persistencyManager.addAlbum(album, index: index)
        if isOnline {
            httpClient.postRequest("/api/addAlbum", body: album.description)
        }
    }
    
    func deleteAlbum(index: Int) {
        persistencyManager.deleteAlbumAtIndex(index)
        if isOnline {
            httpClient.postRequest("/api/deleteAlbum", body: "\(index)")
        }
    }
    
    func saveAlbums() {
        persistencyManager.saveAlbums()
    }
    
    func downloadImage(notification: NSNotification) {
        
        let userInfo = notification.userInfo as! [String: AnyObject]
        let imageView = userInfo["imageView"] as! UIImageView?

        let coverUrl = userInfo["coverUrl"] as! String
        
        
        if let imageViewUnWrapped = imageView {
            
            imageViewUnWrapped.image = persistencyManager.getImage(coverUrl)

            if imageViewUnWrapped.image == nil {
            
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
                    
                    let downloadedImage = self.httpClient.downloadImage(coverUrl)
                    
                    dispatch_sync(dispatch_get_main_queue(), { () -> Void in
                        imageViewUnWrapped.image = downloadedImage
                        
                        self.persistencyManager.saveImage(downloadedImage, filename: NSString(string: coverUrl).lastPathComponent)
                        
                    })
                })
            }
        }
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

}



















































