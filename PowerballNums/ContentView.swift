//
//  ContentView.swift
//  PowerballNums
//
//  Created by Bobby on 4/27/23.
//

import SwiftUI

var drawingData: DrawingData? = getData.get()

struct ContentView: View {
    var body: some View {
        if drawingData == nil
        {
            VStack {
                Text("Unable to load drawing data, check internet connection")
            }
        }
        else
        {
            NavigationView {
                List(drawingData!.drawings) { drawing in
                    NavigationLink(destination: Details(drawing: drawing))
                    {
                        
                        let nums = drawing.winning_numbers.split(separator: " ")
                        
                        VStack(alignment: .leading) {
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
                                    .frame(width: 35, height: 35)
                                }
                            }
                            Text(dateFormatter.string(from: drawing.draw_date))
                        }
                    }
                }.navigationTitle("Powerball Numbers")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
