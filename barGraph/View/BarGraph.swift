//
//  BarGraph.swift
//  barGraph
//
//  Created by Костик on 17.01.2022.
//

import SwiftUI

struct BarGraph: View {
    var downloads: [Download]
    @Binding var totalPrice: Float
    @GestureState var isDragging: Bool = false
    @State var offset: CGFloat = 0
    @State var currentDownloadID: String = ""
    var body: some View {
        HStack(spacing: 10){
            ForEach(downloads){ download in
                CardView(download: download)
                
            }
        }
        .frame(height: 150)
        .animation(.easeOut, value: isDragging)
        .gesture(
            DragGesture()
                .updating($isDragging, body: { _, out, _ in
                    out = true
                    
                })
                .onChanged({ value in
                    offset = isDragging ? value.location.x : 0
                    let draggingSpace = UIScreen.main.bounds.width - 60
                    let eachBlock = draggingSpace / CGFloat(downloads.count)
                    let temp = Int(offset / eachBlock)
                    //print(temp)
                    let index = max(min(temp, downloads.count - 1), 0)
                    self.currentDownloadID = downloads[index].id
                    totalPrice = Float(downloads[index].downloads)
                    
                })
                .onEnded({ value in
                    withAnimation{
                        offset = .zero
                        currentDownloadID = ""
                        totalPrice = Float(downloads[downloads.count-1].downloads)
                    }
                })
        )
        .onAppear{
            totalPrice = Float(downloads[downloads.count-1].downloads)
        }
    }
    
    @ViewBuilder
    func CardView(download: Download)->some View {
        
        VStack(spacing: 20){
            GeometryReader{ proxy in
                let size = proxy.size
                
                RoundedRectangle(cornerRadius: 6)
                    .fill(download.color)
                    .opacity(isDragging ? (currentDownloadID == download.id ? 1 : 0.35) : 1)
                    .frame(height: (download.downloads / getMax()) * (size.height))
                //цифры над барами
//                    .overlay(
//
//                        Text("\(Int(download.downloads))")
//                            .font(.callout)
//                            .foregroundColor(download.color)
//                            .opacity(isDragging && currentDownloadID == download.id ? 1 : 0)
//                            .offset(y: -30)
//                        , alignment: .top
//                    )
                    .frame(maxHeight: .infinity, alignment: .bottom)
            }
            Text(download.day)
                .font(.callout)
                .foregroundColor(currentDownloadID == download.id ? download.color : .gray)
        }
    }
    
    func getMax() -> CGFloat {
        let max = downloads.max { first, second in
            return second.downloads > first.downloads
        }
        
        return max?.downloads ?? 0
    }
}

struct BarGraph_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
