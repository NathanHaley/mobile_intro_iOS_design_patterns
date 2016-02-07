//
//  AlbumExtensions.swift
//  BlueLibrarySwift
//
//  Created by Nathan Haley on 2/5/16.
//  Copyright © 2016 Raywenderlich. All rights reserved.
//

extension Album {
    
    func ae_tableRepresentation() -> (titles: [String], values:[String]) {
        return (["Artist", "Album", "Genre", "Year"], [artist, title, genre, year])
    }
}
