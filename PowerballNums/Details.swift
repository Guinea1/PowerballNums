//
//  Details.swift
//  PowerballNums
//
//  Created by Bobby on 4/28/23.
//

import SwiftUI

struct Details: View {
    
    var drawing: Drawing
    
    var body: some View {
        let nums = drawing.winning_numbers.split(separator: " ")
        
        VStack {
            HStack {
                ForEach(nums.indices, id: \.self) { index in
                    ZStack {
                        if index == nums.count-1
                        {
                            Circle()
                                .fill(.red)
                            Text(nums[index])
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        }
                        else
                        {
                            Circle()
                                .strokeBorder(.black, lineWidth: 1)
                            Text(nums[index])
                                .fontWeight(.semibold)
                        }
                    }
                    .frame(width: 45, height: 45)
                }
            }
            Text("Power Play Multiplier: \(drawing.multiplier)x")
                .font(.title2)
                .fontWeight(.bold)
        }.navigationTitle(dateFormatter.string(from: drawing.draw_date))
    }
}

struct Details_Previews: PreviewProvider {
    static var previews: some View {
        Details(drawing: Drawing(draw_date: Date.now, winning_numbers: "00 11 22 33 44 55", multiplier: "2"))
    }
}
