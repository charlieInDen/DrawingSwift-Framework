/*
 * DrawingProtocols.swift
 * Created by Nishant Sharma on 8/22/18.
 *
 *
 * DrawingSwift: https://github.com/charlieInDen/DrawingSwift-Framework
 *
 * Copyright (c) 2018 Nishant Sharma
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */
import UIKit

enum DrawingMode {
    case scale
    case originalSize
};
enum DrawingToolType {
    case pen
    case line
    case arrow
    case rectagleStroke
    case rectagleFill
    case ellipseStroke
    case ellipseFill
    case eraser
    case draggableText
    case custom
};
protocol SomeProtocol {
    var lineColor: UIColor { get set }
    var lineWidth: Float { get set }
    var lineAlpha: Float { get set }
    var edgeSnapThreshold: Float { get set }
    var drawMode: DrawingMode { get set }
    var draggableTextFontName: String { get set }
    var draggableTextRotateImage: UIImage? { get set }
    var draggableTextCloseImage: UIImage? { get set }
    //Get current drawing
    var image: UIImage? { get }
    var backgroundImage: UIImage? { get set }
    var undoSteps: Int { get }
}
protocol SomeProtocol1 {
    // load external image
    func loadImage(image: UIImage)
    func loadImageData(imageData: NSData)
    
    // erase all
    func clear()
    
    // cleanup in preparation for taking a snapshot
    func prepareForSnapshot()
    
    // undo / redo
    func canUndo() -> Bool
    func undoLatestStep()
    
    func canRedo() -> Bool
    func redoLatestStep()
    
    func applyDrawToImage(baseImage: UIImage) -> UIImage
    
    /**
     @discussion Discards the tool stack and renders them to prev_image, making the current state the 'start' state.
     (Can be called before resize to make content more predictable)
     */
    func commitAndDiscardToolStack()

}
protocol DrawingViewPrivate {
    //CGPoint variables
    var currentPoint: CGPoint? { get set }
    var previousPoint1: CGPoint? { get set }
    var previousPoint2: CGPoint? { get set }
    //Arrays variables
    var pathArray: Array<Any>? { get set }
    var redoStates: Array<Any>? { get set }
    var undoStates: Array<Any>? { get set }
    var currentTool: DrawingTool? { get set}
    var cacheImage: UIImage? { get set}
//    var draggableTextView: DrawingTool? { get set}
}
protocol DrawingTool {
    //Variables
    var lineColor: UIColor { get set }
    var lineAlpha: Float { get set }
    var lineWidth: Float { get set }
    //Methods
    func setInitialPoint(firstPoint: CGPoint)
    func moveFromPoint(startPoint: CGPoint, toPoint endPoint: CGPoint)
    func draw()
    func captureToolState() -> DrawingToolState
}
 protocol DrawingViewDelegate{
    func drawingView(_ view: DrawingView, willBeginDrawUsingTool tool: DrawingTool)
    func drawingView(_ view: DrawingView, didEndDrawUsingTool tool: DrawingTool)
    func drawingView(_ view: DrawingView, didRedoDrawUsingTool tool: DrawingTool)
    func drawingView(_ view: DrawingView, didUndoDrawUsingTool tool: DrawingTool)
}
