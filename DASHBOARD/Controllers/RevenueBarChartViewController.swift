//
//  RevenueBarChartViewController.swift
//  WEINVEST
//
//  Created by Madhu on 02/09/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import SwiftCharts

class RevenueBarChartViewController: UIViewController {
    
    fileprivate var chart: Chart?
    
    //MARK: ViewLifeCycle
    
    //DidAppear()
    
    override func viewDidAppear(_ animated: Bool) {
        showChart(horizontal: false)
    }
    
    //MARK: Helper Methods
    
    fileprivate func barsChart(horizontal: Bool) -> Chart {
        let tuplesXY = [(2, 8), (4, 6), (6, 4), (8, 10), (10, 8), (12, 6), (14, 10), (16, 12),  (18, 14)]
        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep"]
        
        func reverseTuples(_ tuples: [(Int, Int)]) -> [(Int, Int)] {
            return tuples.map{($0.1, $0.0)}
        }
        
        let chartPoints = (horizontal ? reverseTuples(tuplesXY) : tuplesXY).map{ChartPoint(x: ChartAxisValueInt($0.0), y: ChartAxisValueInt($0.1))}
        
        var labelSettings = ChartLabelSettings(font: ExamplesDefaults.labelFont)
        labelSettings.fontColor = UIColor.hexStringToUIColor(hex: "#636363")
        
        let generator = ChartAxisGeneratorMultiplier(2)
        let labelsGenerator = ChartAxisLabelsGeneratorFunc {scalar in
            return ChartAxisLabel(text: (Int(scalar - 2) % 4 == 0 && scalar > 0) ? months[(Int(scalar)/2) - 1] : "", settings: labelSettings)
        }
        let xGenerator = ChartAxisGeneratorMultiplier(2)
        let xModel = ChartAxisModel(firstModelValue: 0, lastModelValue: 20, axisTitleLabels: [ChartAxisLabel(text: "", settings: labelSettings)], axisValuesGenerator: xGenerator, labelsGenerator: labelsGenerator)
        let yModel = ChartAxisModel(firstModelValue: 0, lastModelValue: 20, axisTitleLabels: [ChartAxisLabel(text: "", settings: labelSettings.defaultVertical())], axisValuesGenerator: generator, labelsGenerator: labelsGenerator)
        
        let barViewGenerator = {(chartPointModel: ChartPointLayerModel, layer: ChartPointsViewsLayer, chart: Chart) -> UIView? in
            let bottomLeft = layer.modelLocToScreenLoc(x: 0, y: 0)
            
            let barWidth: CGFloat =  20
            
            let settings = ChartBarViewSettings(animDuration: 0.5, cornerRadius : 4)
            
            
            let (p1, p2): (CGPoint, CGPoint) = {
                if horizontal {
                    return (CGPoint(x: bottomLeft.x, y: chartPointModel.screenLoc.y), CGPoint(x: chartPointModel.screenLoc.x, y: chartPointModel.screenLoc.y))
                } else {
                    return (CGPoint(x: chartPointModel.screenLoc.x, y: bottomLeft.y - 30), CGPoint(x: chartPointModel.screenLoc.x, y: chartPointModel.screenLoc.y - 30))
                }
            }()
            return ChartPointViewBar(p1: p1, p2: p2, width: barWidth, bgColor: UIColor(red: 250/255, green: 98/255, blue: 32/255, alpha: 1.0), settings: settings)
        }
        
        let frame = ExamplesDefaults.chartFrame(view.bounds)
        let chartFrame = chart?.frame ?? CGRect(x: -30, y: 0, width:self.view.bounds.width , height: self.view.bounds.height + 15)
        
        let chartSettings = ExamplesDefaults.chartSettingsWithPanZoom
        
        let coordsSpace = ChartCoordsSpaceLeftBottomSingleAxis(chartSettings: chartSettings, chartFrame: chartFrame, xModel: xModel, yModel: yModel)
        let (xAxisLayer, yAxisLayer, innerFrame) = (coordsSpace.xAxisLayer, coordsSpace.yAxisLayer, coordsSpace.chartInnerFrame)
        
        
        let chartPointsLayer = ChartPointsViewsLayer(xAxis: xAxisLayer.axis, yAxis: yAxisLayer.axis, chartPoints: chartPoints, viewGenerator: barViewGenerator)
        
        return Chart(
            frame: chartFrame,
            innerFrame: innerFrame,
            settings: chartSettings,
            layers: [
                xAxisLayer,
                chartPointsLayer
            ]
        )
    }
    
    fileprivate func showChart(horizontal: Bool) {
        self.chart?.clearView()
        let chart = barsChart(horizontal: horizontal)
        view.addSubview(chart.view)
        self.chart = chart
    }
}
