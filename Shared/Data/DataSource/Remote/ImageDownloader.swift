//
//  ImageDownloader.swift
//  Globedex
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-11-30.
//

import Foundation
import SwiftUI

actor ImageDownloader {
    
    private enum CacheEntry {
        case inProgress(Task<Image, Error>)
        case ready(Image)
    }
    
    private var cache: [URL: CacheEntry] = [:]
    
    func image(from url: URL) async throws -> Image? {
        if let cached = cache[url] {
            switch cached {
                case .ready(let image):
                    return image
                case .inProgress(let handle):
                    return try await handle.value
            }
        }
        let handle = Task { try await downloadImage(from: url) }
        cache[url] = .inProgress(handle)
        do {
            let image = try await handle.value
            cache[url] = .ready(image)
            return image
        } catch {
            cache[url] = nil
            throw error
        }
    }

    func downloadImage(from url:URL) async throws -> Image {
        let request = URLRequest.init(url:url)
        let (data, response) = try await URLSession.shared.data(for: request)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw FetchError.badID }
        
        #if os(iOS)
            let maybeImage = UIImage(data: data)
            guard let thumbnail = await maybeImage?.byPreparingThumbnail(
                ofSize: CGSize(width: 40, height: 40)
            ) else { throw FetchError.badImage }
            return  Image(uiImage: thumbnail)
        #endif
        
        #if os(macOS)
            let maybeImage = NSImage(data: data)
            return  Image.init(nsImage: maybeImage!)
        #endif
    }
}

enum FetchError:Error{
    case badID
    case badImage
    
}
