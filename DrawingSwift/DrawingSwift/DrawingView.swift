//
//  DrawingView.swift
//  DrawingSwift
//
//  Created by Nishant Sharma on 8/22/18.
//  Copyright © 2018 Personal. All rights reserved.
//

import UIKit

class DrawingView: UIView, SomeProtocol, SomeProtocol1, DrawingViewPrivate {
    //MARK: -
    var currentPoint: CGPoint?
    
    var previousPoint1: CGPoint?
    
    var previousPoint2: CGPoint?
    
    var pathArray: Array<Any>?
    
    var redoStates: Array<Any>?
    
    var undoStates: Array<Any>?
    
    var currentTool: DrawingTool?
    
    var cacheImage: UIImage?
    //MARK: -
    //Variable protocol
    var lineColor: UIColor = UIColor.black
    var lineWidth: Float = 0.0
    var lineAlpha: Float = 0.0
    var edgeSnapThreshold: Float = 0.0
    var drawMode: DrawingMode = .originalSize
    var draggableTextFontName: String = ""
    var draggableTextRotateImage: UIImage?
    var draggableTextCloseImage: UIImage?
    var image: UIImage?
    var backgroundImage: UIImage?
    var undoSteps: Int = 0
    //MARK: -
    //Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    func configure() {
        self.pathArray = []
        
        self.redoStates = []
        self.undoStates = []
        
        // set the default values for the public properties
        self.lineColor = Color.green.rawValue;
        self.lineWidth = DrawLine.kDefaultLineWidth.rawValue;
        self.lineAlpha = DrawLine.kDefaultLineAlpha.rawValue;
        
        self.drawMode = DrawingMode.originalSize;
        
        // set the transparent background
        self.backgroundColor = Color.clear.rawValue;
    }
    //MARK: -
    override func draw(_ rect: CGRect) {
        switch self.drawMode {
        case .originalSize:
            self.cacheImage?.draw(at: CGPoint.zero)
        case .scale:
            self.cacheImage?.draw(in: self.bounds)
        }
        self.currentTool?.draw()
    }
    //MARK: -
    //Member protocol
    func loadImage(image: UIImage) {
        
    }
    
    func loadImageData(imageData: NSData) {
        
    }
    
    func clear() {
        
    }
    
    func prepareForSnapshot() {
        
    }
    
    func canUndo() -> Bool {
        return true
    }
    
    func undoLatestStep() {
        
    }
    
    func canRedo() -> Bool {
        return true
    }
    
    func redoLatestStep() {
        
    }
    
    func applyDrawToImage(baseImage: UIImage) -> UIImage {
        return UIImage.init()
    }
    
    func commitAndDiscardToolStack() {
        self.updateCacheImage(redraw: true)
        self.backgroundImage = self.cacheImage ?? UIImage.init()
        self.pathArray?.removeAll()
    }
    
    func updateCacheImage(redraw: Bool) {
        
    }
    
    
}
