//
//  RealmManager.swift
//  Iqraali
//
//  Created by BinaryBoy on 4/30/18.
//  Copyright © 2018 abdelrahman mohamed. All rights reserved.
//

import Foundation
import RealmSwift

struct RealmManager {

    static var realm: Realm {
            do {
                let realm = try Realm()
                return realm
            } catch {
//                CLSLog("Could not access  database: \(error.localizedDescription)")
            }
            return self.realm
    }

    static func write(writeClosure: () -> Void) {
        do {
            try realm.write {
                writeClosure()
            }
        } catch {
//            CLSLog("Could not write to database: \(error.localizedDescription)")
        }
    }
}

extension Object {
    
    /** Must be called from main thread */
    func save(_ update: Bool = true) {
        
        RealmManager.write {
            RealmManager.realm.add(self, update: update)
        }
    }
    
}
