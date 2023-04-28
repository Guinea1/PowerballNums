//
//  PowerballNumsApp.swift
//  PowerballNums
//
//  Created by Bobby on 4/27/23.
//

import SwiftUI

struct DrawingData: Codable, Identifiable {
    let id = UUID()
    var status: String
    var drawings: [Drawing]
    
    enum CodingKeys: String, CodingKey {
        case status
        case drawings
    }
}

struct Drawing: Codable, Identifiable {
    let id = UUID()
    let draw_date: Date
    let winning_numbers: String
    let multiplier: String
    
    enum CodingKeys: String, CodingKey {
        case draw_date
        case winning_numbers
        case multiplier
    }
}

let dateFormatter = DateFormatter()
let formatter2 = DateFormatter()

class getData {
    class func get() -> DrawingData? {
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        formatter2.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        var drawingdata: DrawingData?
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(formatter2)
        
        let first =
        """
{
    "status": "ok",
    "drawings":
"""
        
        let url = URL(string: "https://data.ny.gov/resource/d6yy-54nr.json")!
        let data = try? Data(contentsOf: url)
        
        if data == nil
        {
            return nil
        }
        
        let last = "}"
        
        let str = String(decoding: data!, as: UTF8.self)
        
        let final = Data((first + str + last).utf8)

        drawingdata = try? decoder.decode(DrawingData.self, from: final)
        
        return drawingdata
    }
}

@main
struct PowerballNumsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
