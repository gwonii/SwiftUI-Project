//
//  DAO.swift
//  Project_A
//
//  Created by gwonii on 2020/02/21.
//  Copyright © 2020 gwonii. All rights reserved.
//

import UIKit
import Foundation
import CoreLocation

let landmarkData: [Landmark] = load("landmarkData.json")
let mailData: [MailModel] =
    [
    MailModel(mailTitle: "다우오피스 1000만 유저 돌파", time: "10:00"),
    MailModel(mailTitle: "다우뉴스 클리핑", time: "12:00"),
    MailModel(mailTitle: "호권이는 오늘 하프데이라는데...", time: "14:00"),
    MailModel(mailTitle: "호권이가 드디어 1인분을 하기 시작했다고 한다.", time: "16:00"),
    MailModel(mailTitle: "레이아웃이 잡히기 시작했어요", time: "22:00")
    ]

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

//final class ImageStore {
//    typealias _ImageDictionary = [String: CGImage]
//    fileprivate var images: _ImageDictionary = [:]
//
//    fileprivate static var scale = 2
//
//    static var shared = ImageStore()
//
//    func image(name: String) -> Image {
//        let index = _guaranteeImage(name: name)
//
//        return Image(images.values[index], scale: CGFloat(ImageStore.scale), label: Text(name))
//    }
//
//    static func loadImage(name: String) -> CGImage {
//        guard
//            let url = Bundle.main.url(forResource: name, withExtension: "jpg"),
//            let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
//            let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
//        else {
//            fatalError("Couldn't load image \(name).jpg from main bundle.")
//        }
//        return image
//    }
//
//    fileprivate func _guaranteeImage(name: String) -> _ImageDictionary.Index {
//        if let index = images.index(forKey: name) { return index }
//
//        images[name] = ImageStore.loadImage(name: name)
//        return images.index(forKey: name)!
//    }
//}
