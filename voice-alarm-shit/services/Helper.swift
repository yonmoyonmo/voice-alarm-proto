//
//  Helper.swift
//  voice-alarm-shit
//
//  Created by yonmo on 2021/10/20.
//

import Foundation

func getCreationDate(for file: URL)->Date {
    if let attributes = try? FileManager.default.attributesOfItem(atPath: file.path) as [FileAttributeKey: Any],
       let creationDate = attributes[FileAttributeKey.creationDate] as? Date{
        return creationDate
    }else{
        return Date()
    }
}
