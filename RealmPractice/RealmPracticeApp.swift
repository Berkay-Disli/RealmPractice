//
//  RealmPracticeApp.swift
//  RealmPractice
//
//  Created by Berkay Disli on 15.09.2022.
//

import SwiftUI

@main
struct RealmPracticeApp: App {
    let migrator = Migrator()
    
    var body: some Scene {
        WindowGroup {
            let _ = UserDefaults.standard.set(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
            let _ = print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
            ContentView()
        }
    }
}
