//
//  Core.swift
//  MenuStorage
//
//  Created by Joel Male on 21/07/2016.
//  Copyright © 2016 Joel Male. All rights reserved.
//

import Foundation

struct settings {
    var updateFrequency : NSTimeInterval
}

func getFreeSize() -> Int64? {
    let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
    if let dictionary = try? NSFileManager.defaultManager().attributesOfFileSystemForPath(paths.last!) {
        if let freeSize = dictionary[NSFileSystemFreeSize] as? NSNumber {
            return freeSize.longLongValue
        }
    }else{
        print("Error Obtaining System Memory Info:")
    }
    return nil
}

func getTotalSize() -> Int64?{
    let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
    if let dictionary = try? NSFileManager.defaultManager().attributesOfFileSystemForPath(paths.last!) {
        if let freeSize = dictionary[NSFileSystemSize] as? NSNumber {
            return freeSize.longLongValue
        }
    }else{
        print("Error Obtaining System Memory Info:")
    }
    return nil
}

func setNewUpdateFrequency(newTime : NSTimeInterval) {
    let defaults = NSUserDefaults.standardUserDefaults()
    
    defaults.setValue(newTime, forKey: updateFrequencyKey)
    
    defaults.synchronize()
}

func getUpdateFrequency() -> NSTimeInterval? {
    let defaults = NSUserDefaults.standardUserDefaults()
    
    if let updateFrequency = defaults.stringForKey(updateFrequencyKey) {
        return (updateFrequency as NSString).doubleValue
    }
    
    return nil
}