//
//  Download.swift
//  barGraph
//
//  Created by Костик on 17.01.2022.
//

import SwiftUI

struct Download: Identifiable {
    var id = UUID().uuidString
    var downloads: CGFloat
    var day: String
    var color: Color
}

var weekDownloads: [Download] = [
    Download(downloads: 30, day: "S", color: .purple),
    Download(downloads: 45, day: "M", color: .purple),
    Download(downloads: 60, day: "T", color: .green),
    Download(downloads: 90, day: "W", color: .green),
    Download(downloads: 40, day: "T", color: .purple),
    Download(downloads: 50, day: "F", color: .green),
    Download(downloads: 20, day: "S", color: .purple),
]
