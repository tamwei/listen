//
//  ExtUIImage.swift
//  listen
//
//  Created by tw on 2018/8/3.
//  Copyright © 2018年 DMWL. All rights reserved.
//

import UIKit

extension UIImage {
       
    func drawImge(image:UIImage,color:UIColor) -> UIImage {
         let width = image.size.width/2
         let height = image.size.height/2
        
        UIGraphicsBeginImageContext(CGSize(width: KScreenWidth, height: KScreenHeight))
        let context = UIGraphicsGetCurrentContext()
        
        context?.setFillColor(color.cgColor)
        context?.fill(CGRect(x: 0, y: 0, width: KScreenWidth, height: KScreenHeight))
        
        let rect = CGRect(x: 0, y: KScreenHeight - height, width: width, height: height)
        context?.translateBy(x: rect.origin.x, y: rect.origin.y)
        context?.translateBy(x: 0, y: rect.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        context?.translateBy(x: -rect.origin.x, y: -rect.origin.y)
        
        context?.setShadow(offset: CGSize(width: 0, height: 10), blur: 100, color: color.cgColor)
        context?.draw(image.cgImage!, in: rect)
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
    
    
    // 将视图转化为image
    class func getImageFromView(view:UIView) ->UIImage{
        
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, UIScreen.main.scale);
        
        let context = UIGraphicsGetCurrentContext()
        
        view.layer.render(in: context!)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image!
        
    }
    
    
    // 将iconFont 转为image
    class func getImageFromIconFont(iconCode:String,iconColor:UIColor,fontSize:CGFloat) ->UIImage {
        let nscode = iconCode as NSString
        let rect = nscode.boundingRect(with:CGSize(width: 0.0, height: 0.0) , options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font :  UIFont(name: "IconFont", size: fontSize)!], context: nil)
        let size = rect.size
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        label.font = UIFont(name: "IconFont", size: fontSize)
        label.textAlignment = .center
        label.textColor = iconColor
        label.text = iconCode
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        label.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    
    
    // 生成二维码图片
    class func getImageFromQRCode(code:String,logo:UIImage?) -> UIImage {
        let img = UIImage()
        
        let filter = CIFilter(name: "CIQRCodeGenerator")
        filter?.setDefaults()
        filter?.setValue(code.data(using: String.Encoding.utf8), forKey: "inputMessage")
        
        if let outputImage = filter?.outputImage {
            
            // 生成高清图片
            let qrCodeImage = img.setupHighDefinitionUIImage(outputImage, size: 300)
            
            if var logo = logo {
                logo = img.addBorderForImage(logo, borderWidth: 20, borderColor: .white)
                let newImage = img.syntheticImage(qrCodeImage, iconImage: logo, width: 80, height: 80)
                return newImage
            }
            
            return qrCodeImage
        }
        
        
        return img
    }
    
    //image: 二维码 iconImage:头像图片 width: 头像的宽 height: 头像的宽
   private func syntheticImage(_ image: UIImage, iconImage:UIImage, width: CGFloat, height: CGFloat) -> UIImage{
        //开启图片上下文
        UIGraphicsBeginImageContext(image.size)
        //绘制背景图片
        image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))
        
        let x = (image.size.width - width) * 0.5
        let y = (image.size.height - height) * 0.5
        iconImage.draw(in: CGRect(x: x, y: y, width: width, height: height))
        //取出绘制好的图片
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        //关闭上下文
        UIGraphicsEndImageContext()
        //返回合成好的图片
        if let newImage = newImage {
            return newImage
        }
        return UIImage()
    }
    
    //MARK: - 生成高清的UIImage
   private func setupHighDefinitionUIImage(_ image: CIImage, size: CGFloat) -> UIImage {
        let integral: CGRect = image.extent.integral
        let proportion: CGFloat = min(size/integral.width, size/integral.height)
        
        let width = integral.width * proportion
        let height = integral.height * proportion
        let colorSpace: CGColorSpace = CGColorSpaceCreateDeviceGray()
        let bitmapRef = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: 0)!
        
        let context = CIContext(options: nil)
        let bitmapImage: CGImage = context.createCGImage(image, from: integral)!
        
        bitmapRef.interpolationQuality = CGInterpolationQuality.none
        bitmapRef.scaleBy(x: proportion, y: proportion);
        bitmapRef.draw(bitmapImage, in: integral);
        let image: CGImage = bitmapRef.makeImage()!
        return UIImage(cgImage: image)
    }
    
    //生成边框
   private func addBorderForImage(_ sourceImage: UIImage, borderWidth: CGFloat, borderColor: UIColor) -> UIImage {
    
        let imageWidth = sourceImage.size.width + 2 * borderWidth
        let imageHeight = sourceImage.size.height + 2 * borderWidth
    
        UIGraphicsBeginImageContextWithOptions(CGSize(width: imageWidth, height: imageHeight), false, 0.0)
        UIGraphicsGetCurrentContext()
    
        let bezierPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: imageWidth, height: imageHeight), cornerRadius: borderWidth*2)
        bezierPath.fill()
        bezierPath.lineWidth = borderWidth
        borderColor.setStroke()
        bezierPath.stroke()
        bezierPath.addClip()
        sourceImage.draw(in: CGRect(x: borderWidth, y: borderWidth, width: sourceImage.size.width, height: sourceImage.size.height))
    
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    
        return image!
    }

    // 图片灰度处理
    open class func grayImage(sourceImage : UIImage) -> UIImage{
        let imageWidth = sourceImage.size.width
        let imageHeight = sourceImage.size.height
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: imageWidth, height: imageHeight), false, UIScreen.main.scale)
       
        
        
        let colorSpace = CGColorSpaceCreateDeviceGray()
        let context = CGContext(data: nil , width: Int(imageWidth), height: Int(imageHeight),bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: CGImageAlphaInfo.none.rawValue)
        context?.draw(sourceImage.cgImage!, in: CGRect(x: 0, y: 0, width: imageWidth, height: imageHeight))
        let cgImage = context!.makeImage()
        let grayImage = UIImage.init(cgImage: cgImage!)
        return grayImage
    }
    
    
   

}

