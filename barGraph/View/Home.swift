//
//  Home.swift
//  barGraph
//
//  Created by Костик on 17.01.2022.
//

import SwiftUI

struct Home: View {
    @State var totalPrice: Float = 0
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 15){
                Spacer()
                DownloadStats()
                Spacer()
            }
            .padding(15)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.3).ignoresSafeArea())
        .preferredColorScheme(.dark)
        
    }
    @ViewBuilder
    func DownloadStats()->some View {
        
        VStack(spacing: 15){
            HStack{
                VStack(alignment: .leading, spacing: 13){
                    Text("Ads Expense")
                        .font(.title)
                        .fontWeight(.semibold)
                    Menu{
                        
                    } label: {
                        Label{
                            Image(systemName: "chevron.down")
                        } icon: {
                            Text("Last 7 Days")
                        }
                        .font(.callout)
                        .foregroundColor(.gray)
                    }
                }
                Spacer()
                Button{
                    
                } label: {
                    Image(systemName: "arrow.up.forward")
                        .font(.title2.bold())
                }
                .foregroundColor(.white)
                .offset(y: -10)
            }
            HStack{
                Text("$\(String(format: "%.2f", totalPrice))")
                    .font(.largeTitle.bold())
                Spacer()
                Button{
                    
                } label: {
                    Text("Download")
                        .font(.callout)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray.opacity(0.3))
                        )
                }
            }
            .padding(.vertical, 20)
            BarGraph(downloads: weekDownloads, totalPrice: $totalPrice)
                .padding(.top, 25)
        }
        .padding(15)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.black)
        )
        .padding(.vertical, 20)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
