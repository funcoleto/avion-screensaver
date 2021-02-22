//
//  AppDelegate.swift
//  TestWallpaper
//
//  Created by Daniel on 11/02/2021.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    lazy var sheetController: ConfigureSheetController = ConfigureSheetController()



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


    private func objectsFromNib(loadNibNamed nibName: String) -> [AnyObject] {
        var topLevelObjects: NSArray? = NSArray()

        _ =  Bundle.main.loadNibNamed(nibName, owner: sheetController,
                                      topLevelObjects: &topLevelObjects)

        return topLevelObjects! as [AnyObject]
    }
    
    
}

