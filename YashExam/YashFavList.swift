//
//  YashFavList.swift
//  YashExam
//
//  Created by YASH on 2017-03-31.
//  Copyright © 2017 YASH. All rights reserved.
//

//
//  FavoritesList.swift
//  Fonts
//
//  Created by Molly Maskrey on 7/11/16.
//  Copyright © 2016 MollyMaskrey. All rights reserved.
//

import Foundation
import UIKit

class YashFavList {
    static let sharedFavoritesList = YashFavList()
    private(set) var favorites:[String]
    
    init() {
        let defaults = UserDefaults.standard
        let storedFavorites = defaults.object(forKey: "favorites") as? [String]
        favorites = storedFavorites != nil ? storedFavorites! : []
    }
    
    func addFavorite(fontName: String) {
        if !favorites.contains(fontName) {
            favorites.append(fontName)
            saveFavorites()
        }
    }
    
    func removeFavorite(fontName: String) {
        if let index = favorites.index(of: fontName) {
            favorites.remove(at: index)
            saveFavorites()
        }
    }
    
    private func saveFavorites() {
        let defaults = UserDefaults.standard
        defaults.set(favorites, forKey: "favorites")
        defaults.synchronize()
    }
    
    func moveItem(fromIndex from: Int, toIndex to: Int) {
        let item = favorites[from]
        favorites.remove(at: from)
        favorites.insert(item, at: to)
        saveFavorites()
    }
    
}

