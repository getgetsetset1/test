//
//  MGPrinter.swift
//  MGPrinter
//
//  Created by hello on 2018/2/13.
//  Copyright © 2018年 hello. All rights reserved.
//

import UIKit

public enum PrintingType: String, Codable, Equatable {
    case `default` = "#A9A3E9"
    case warning = "#FEC42E"
    case error = "#E2614C"
    
    public var emoji: String {
        switch self {
        case .warning:
            return "⚠️"
        case .error:
            return "❌"
        default:
            return "💌"
        }
    }
}

class MGPrinter: NSObject {
    static func print(_ items: Any?...,
        type: PrintingType = .default,
        function: String = #function,
        line: Int = #line,
        file: String = #file
        ) {
        let separator = "▷ _______________________________"
        var elements: [String] = [separator]
        let filename = (file as NSString).lastPathComponent
        let date = Date.init(timeIntervalSinceNow: 0)
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        let dateString = dateFormatter.string(from: date)
        
        elements.append("▷ \(type.emoji): \(dateString)")
        elements.append("▷ 📋: \(filename)")
        elements.append("▷ 🔢: \(line)")
        elements.append("▷ ⚛️: \(function)")
        
        let mapped = items.map {
            i -> String in
            return String.init(describing: i)
        }
        elements.append(mapped.joined(separator: ""))
        elements.append(separator)
        
        let result = elements.joined(separator: "\n")
        
        Swift.print(result)
    }
}
