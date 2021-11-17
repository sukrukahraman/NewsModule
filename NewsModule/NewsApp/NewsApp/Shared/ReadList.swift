//
//  UserDefaultsExtension.swift
//  NewsApp
//
//  Created by Sukru Kahraman on 17.11.2021.
//

import Foundation

private enum Consts {
    static let readListKey: String = "readList"
}
final public class ReadList {
    
    static let shared = ReadList()
    
    var readLists: [String] = []
    
    init() {
        getList()
    }
    
    func getList() {
        let defaults = UserDefaults.standard
        if let lists = defaults.object(forKey: Consts.readListKey) as? [String] {
            readLists = lists
        }
    }
    
    func saveList() {
        let defaults = UserDefaults.standard
        defaults.set(readLists, forKey: Consts.readListKey)
    }
    
    func addOrRemoveArticle(id: String?, title: String?) {
        guard let id = id , let title = title else { return }
        let str = "\(id)-\(title)"
        if let index = readLists.firstIndex(of: str) {
            readLists.remove(at: index)
        } else {
            readLists.append(str)
        }
        saveList()
    }
    
    
}
