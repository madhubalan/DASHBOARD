//
//  CommissionStackBarChartViewController.swift
//  WEINVEST
//
//  Created by Madhu on 02/09/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import SwiftCharts

class CommissionStackBarChartViewController: UIViewController {
    
    fileprivate var chart: Chart? // arc
    
    //MARK: ViewLifeCycle
    
    //DidAppear()
    
    override func viewDidAppear(_ animated: Bool) {
        showChart(horizontal: false)
    }
    
    //MARK: Helper Methods
    
    fileprivate func chart(horizontal: Bool) -> Chart {
        var labelSettings = ChartLabelSettings(font: ExamplesDefaults.labelFont)
        
        labelSettings.fontColor = UIColor.hexStringToUIColor(hex: "#636363")
        let alpha: CGFloat = 0.6
        
        let color0 = UIColor(red: 25/255, green: 56/255, blue: 181/255, alpha: 1.0)
        let color1 = UIColor(red: 127/255, green: 215/255, blue: 217/255, alpha: 1.0)
        let color2 = UIColor(red: 36/255, green: 160/255, blue: 230/255, alpha: 1.0)
        let color3 = UIColor(red: 255/255, green: 185/255, blue: 0, alpha: 1.0)
        
        let zero = ChartAxisValueDouble(0)
        let barModels = [
            ChartStackedBarModel(constant: ChartAxisValueString("Jan", order: 1, labelSettings: labelSettings), start: zero, items: [
                ChartStackedBarItemModel(quantity: 2000, bgColor: color0),
                ChartStackedBarItemModel(quantity: 3500, bgColor: color1),
                ChartStackedBarItemModel(quantity: 6000, bgColor: color2),
                ChartStackedBarItemModel(quantity: 5000, bgColor: color3)
                ]),
            ChartStackedBarModel(constant: ChartAxisValueString("", order: 2, labelSettings: labelSettings), start: zero, items: [
                ChartStackedBarItemModel(quantity: 1500, bgColor: color0),
                ChartStackedBarItemModel(quantity: 3000, bgColor: color1),
                ChartStackedBarItemModel(quantity: 3500, bgColor: color2),
                ChartStackedBarItemModel(quantity: 2500, bgColor: color3)
                ]),
            ChartStackedBarModel(constant: ChartAxisValueString("Mar", order: 3, labelSettings: labelSettings), start: zero, items: [
                ChartStackedBarItemModel(quantity: 1500, bgColor: color0),
                ChartStackedBarItemModel(quantity: 3000, bgColor: color1),
                ChartStackedBarItemModel(quantity: 3500, bgColor: color2),
                ChartStackedBarItemModel(quantity: 2500, bgColor: color3)
                ]),
            ChartStackedBarModel(constant: ChartAxisValueString("", order: 4, labelSettings: labelSettings), start: zero, items: [
                ChartStackedBarItemModel(quantity: 2500, bgColor: color0),
                ChartStackedBarItemModel(quantity: 4000, bgColor: color1),
                ChartStackedBarItemModel(quantity: 6000, bgColor: color2),
                ChartStackedBarItemModel(quantity: 7000, bgColor: color3)
                ]),
            ChartStackedBarModel(constant: ChartAxisValueString("May", order: 5, labelSettings: labelSettings), start: zero, items: [
                ChartStackedBarItemModel(quantity: 2000, bgColor: color0),
                ChartStackedBarItemModel(quantity: 3500, bgColor: color1),
                ChartStackedBarItemModel(quantity: 4000, bgColor: color2),
                ChartStackedBarItemModel(quantity: 3500, bgColor: color3)
                ]),
            ChartStackedBarModel(constant: ChartAxisValueString("", order: 6, labelSettings: labelSettings), start: zero, items: [
                ChartStackedBarItemModel(quantity: 1500, bgColor: color0),
                ChartStackedBarItemModel(quantity: 3000, bgColor: color1),
                ChartStackedBarItemModel(quantity: 3500, bgColor: color2),
                ChartStackedBarItemModel(quantity: 2500, bgColor: color3)
                ]),
            ChartStackedBarModel(constant: ChartAxisValueString("July", order: 7, labelSettings: labelSettings), start: zero, items: [
                ChartStackedBarItemModel(quantity: 4500, bgColor: color0),
                ChartStackedBarItemModel(quantity: 6000, bgColor: color1),
                ChartStackedBarItemModel(quantity: 9000, bgColor: color2),
                ChartStackedBarItemModel(quantity: 8000, bgColor: color3)
                ]),
            ChartStackedBarModel(constant: ChartAxisValueString("", order: 8, labelSettings: labelSettings), start: zero, items: [
                ChartStackedBarItemModel(quantity: 3000, bgColor: color0),
                ChartStackedBarItemModel(quantity: 2000, bgColor: color1),
                ChartStackedBarItemModel(quantity: 6000, bgColor: color2),
                ChartStackedBarItemModel(quantity: 5000, bgColor: color3)
                ]),
            ChartStackedBarModel(constant: ChartAxisValueString("Sep", order: 9, labelSettings: labelSettings), start: zero, items: [
                ChartStackedBarItemModel(quantity: 4000, bgColor: color0),
                ChartStackedBarItemModel(quantity: 5000, bgColor: color1),
                ChartStackedBarItemModel(quantity: 6000, bgColor: color2),
                ChartStackedBarItemModel(quantity: 7000, bgColor: color3)
                ]),
        ]
        
        let (axisValues1, axisValues2) = (
            stride(from: 0, through: 30000, by: 5000).map {ChartAxisValueDouble(Double($0), labelSettings: labelSettings)},
            [ChartAxisValueString("", order: 0, labelSettings: labelSettings)] + barModels.map{$0.constant} + [ChartAxisValueString("", order: 10, labelSettings: labelSettings)]
        )
        
        let (xValues, _) = horizontal ? (axisValues1, axisValues2) : (axisValues2, axisValues1)
        
        
        let labelsGenerator = ChartAxisLabelsGeneratorFunc {scalar in
            
            return ChartAxisLabel(text: (scalar == 0) ? "\(Int(scalar))" : "\(Int(scalar / 1000)) K", settings: labelSettings)
        }
        let generator = ChartAxisGeneratorMultiplier(5000)
        
        let xModel = ChartAxisModel(axisValues: xValues)
        
        
        let yModel = ChartAxisModel(firstModelValue: 0, lastModelValue: 30000, axisValuesGenerator: generator, labelsGenerator: labelsGenerator)
        
        let chartFrame = chart?.frame ?? CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        
        let chartSettings = ExamplesDefaults.chartSettingsWithPanZoom
        
        let coordsSpace = ChartCoordsSpaceLeftBottomSingleAxis(chartSettings: chartSettings, chartFrame: chartFrame, xModel: xModel, yModel: yModel)
        let (xAxisLayer, yAxisLayer, innerFrame) = (coordsSpace.xAxisLayer, coordsSpace.yAxisLayer, coordsSpace.chartInnerFrame)
        
        let barViewSettings = ChartBarViewSettings(animDuration: 0.5, cornerRadius :2)
        let chartStackedBarsLayer = ChartStackedBarsLayer(xAxis: xAxisLayer.axis, yAxis: yAxisLayer.axis, innerFrame: innerFrame, barModels: barModels, horizontal: horizontal, barWidth: 20, settings: barViewSettings, stackFrameSelectionViewUpdater: ChartViewSelectorAlpha(selectedAlpha: 1, deselectedAlpha: alpha))
        
        return Chart(
            frame: chartFrame,
            innerFrame: innerFrame,
            settings: chartSettings,
            layers: [
                xAxisLayer,
                yAxisLayer,
                //                guidelinesLayer,
                chartStackedBarsLayer
            ]
        )
    }
    
    
    fileprivate func showChart(horizontal: Bool) {
        self.chart?.clearView()
        let chart = self.chart(horizontal: horizontal)
        view.addSubview(chart.view)
        self.chart = chart
    }
}
