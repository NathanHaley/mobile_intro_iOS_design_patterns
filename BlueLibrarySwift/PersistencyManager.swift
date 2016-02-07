//
//  PersistencyManager.swift
//  BlueLibrarySwift
//
//  Created by Nathan Haley on 2/5/16.
//  Copyright © 2016 Raywenderlich. All rights reserved.
//

import UIKit

class PersistencyManager: NSObject {
    
    private var albums = [Album]()
    
    func getAlbums() -> [Album] {
        return albums
    }
    
    func addAlbum(album: Album, index: Int) {
        if (albums.count >= index) {
            albums.insert(album, atIndex: index)
        } else {
            albums.append(album)
        }
    }
    
    func deleteAlbumAtIndex(index: Int) {
        albums.removeAtIndex(index)
    }
    
    func saveImage(image: UIImage, filename: String) {
        let path = NSHomeDirectory().stringByAppendingString("/Documents/\(NSString(string: filename).lastPathComponent)")
        let data = UIImagePNGRepresentation(image)
        data!.writeToFile(path, atomically: true)
        
    }
    
    func getImage(filename: String) -> UIImage? {
        let path = NSHomeDirectory().stringByAppendingString("/Documents/\(NSString(string: filename).lastPathComponent)")
        
        do {
            let data = try NSData(contentsOfFile: path, options: .UncachedRead)
            return UIImage(data: data)
        }
        catch let error as NSError {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func saveAlbums() {
        let filename = NSHomeDirectory().stringByAppendingString("/Documents/albums.bin")
        let data = NSKeyedArchiver.archivedDataWithRootObject(albums)
        data.writeToFile(filename, atomically: true)
    }
    
    override init() {
        super.init()
        if let data = NSData(contentsOfFile: NSHomeDirectory().stringByAppendingString("/Documents/albums.bin")) {
            let unarchiveAlbums = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! [Album]?
            if let unwrappedAlbum = unarchiveAlbums {
                albums = unwrappedAlbum
            }
        } else {
            createPlaceholderAlbum()
        }
    }
    
    func createPlaceholderAlbum() {
        
        let album1 = Album(title: "Best of Bowie",
            artist: "David Bowie",
            genre: "Pop",
            coverUrl: "https://s3.amazonaws.com/CoverProject/album/album_david_bowie_best_of_bowie.png",
            year: "1992")
        
        let album2 = Album(title: "It's My Life",
            artist: "No Doubt",
            genre: "Pop",
            coverUrl: "https://s3.amazonaws.com/CoverProject/album/album_zebrahead_panty_raid.png",
            year: "2003")
        
        let album3 = Album(title: "Nothing Like The Sun",
            artist: "Sting",
            genre: "Pop",
            coverUrl: "https://s3.amazonaws.com/CoverProject/album/album_sting_demolition_man.png",
            year: "1999")
        
        let album4 = Album(title: "Staring at the Sun",
            artist: "U2",
            genre: "Pop",
            coverUrl: "https://s3.amazonaws.com/CoverProject/album/album_u2_rattle_and_hum.png",
            year: "2000")
        
        let album5 = Album(title: "American Pie",
            artist: "Madonna",
            genre: "Pop",
            coverUrl: "https://s3.amazonaws.com/CoverProject/album/album_madonna_something_to_remember.png",
            year: "2000")
        
        albums = [album1, album2, album3, album4, album5]
        saveAlbums()
    }
    
    
}
