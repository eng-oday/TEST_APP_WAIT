//
//  Uiimage + Ext.swift
//  TestApp_WAIT
//
//  Created by Oday Dieg on 21/09/2022.
//

import Foundation
import UIKit
extension UIImage {
        func resized(toWidth width: CGFloat) -> UIImage? {
        let canvasSize = CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))
      //  let canvasSize = CGSize(width: width, height: width +  200)
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    
    func compressToAndReturnData(_ expectedSizeInMb:Float) -> Data? {
        let sizeInBytes:Float = expectedSizeInMb * 1024 * 1024
        var needCompress:Bool = true
        var imgData:Data?
        var compressingValue:CGFloat = 1.0
        
        while (needCompress && compressingValue > 0.0) {
            if let data:Data = self.jpegData(compressionQuality: compressingValue) {
            if Float(data.count) < sizeInBytes {
                needCompress = false
                imgData = data
            } else {
                compressingValue -= 0.1
            }
        }
    }

    if let data = imgData {
        if (Float(data.count) < sizeInBytes) {
            return data
        
    }
    }
        return nil

    }
    
}
