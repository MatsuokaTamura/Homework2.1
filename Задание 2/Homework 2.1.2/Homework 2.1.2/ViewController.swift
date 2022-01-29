//
//  ViewController.swift
//  Homework 2.1.2
//
//  Created by Matsuoka Tamura on 28.01.2022.
//

import UIKit

enum Light {
    case red, yellow, green
}

class ViewController: UIViewController {
    // Объединяем с main в viewController
    @IBOutlet var RedLightView: UIView!
    @IBOutlet var YellowLightView: UIView!
    @IBOutlet var GreenLightView: UIView!
    
    @IBOutlet var StartButton: UIButton!
    
    //Задаем параметры яркости цветов
    private var light = Light.red
    private let lightOn: CGFloat = 1
    private let lightOff: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //Округляем кнопочку и выключаем все наши квадратики
        StartButton.layer.cornerRadius = 20
        RedLightView.alpha = lightOff
        YellowLightView.alpha = lightOff
        GreenLightView.alpha = lightOff
    }
    
    // Округляем наши квадратики
    override func viewWillLayoutSubviews() {
        RedLightView.layer.cornerRadius = RedLightView.frame.width / 2
        YellowLightView.layer.cornerRadius = YellowLightView.frame.width / 2
        GreenLightView.layer.cornerRadius = GreenLightView.frame.width / 2
    }

    @IBAction func StartButtonAction() {
        // Чтобы менялось название кнопочки
        if StartButton.currentTitle == "Start" {
            StartButton.setTitle("Next", for: .normal)
        }
        // Чтобы сменялись цвета
        switch light {
        case .red:
            GreenLightView.alpha = lightOff
            RedLightView.alpha = lightOn
            light = .yellow
            
        case .yellow:
            RedLightView.alpha = lightOff
            YellowLightView.alpha = lightOn
            light = .green
            
        case .green:
            GreenLightView.alpha = lightOn
            YellowLightView.alpha = lightOff
            light = .red
        }
    }
}
