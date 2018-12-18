//
//  ViewController.swift
//  实验13_3
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit
import Alamofire

class infoViewController: UIViewController {

    let url = URL(string: "http://t.weather.sojson.com/api/weather/city/101270101")!
    var time:String = ""
    var city:String = ""
    var province:String = ""
    var date:String = ""
    var wendu:String = ""
    var shidu:String = ""
    var pm25:String = ""
    var pm10:String = ""
    var quality:String = ""
    var ganmao:String = ""
    
    
    @IBOutlet weak var lbTime: UILabel!
    @IBOutlet weak var lbCity: UILabel!
    @IBOutlet weak var lbprovince: UILabel!
    @IBOutlet weak var lbUpdate: UILabel!
    @IBOutlet weak var lbTemper: UILabel!
    @IBOutlet weak var lbShidu: UILabel!
    @IBOutlet weak var PM: UILabel!
    @IBOutlet weak var lbPm: UILabel!
    @IBOutlet weak var lbQuality: UILabel!
    @IBOutlet weak var lbGanmao: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        AF.request(url).responseJSON { (response) in
            let json = response.result.value as! Dictionary<String,AnyObject>
            
            self.time = json["time"] as! String
            
            let cityInfo = json["cityInfo"] as! Dictionary<String,AnyObject>
            self.city = cityInfo["city"] as! String
            self.province = cityInfo["parent"] as! String
            
            self.date = json["date"] as! String
            
            let dataInfo = json["data"] as! Dictionary<String,AnyObject>
            self.wendu = dataInfo["wendu"] as! String
            self.shidu = dataInfo["shidu"] as! String
            self.pm25 = String(dataInfo["pm25"] as! Int)
            self.pm10 = String(dataInfo["pm10"] as! Int)
            self.quality = dataInfo["quality"] as! String
            self.ganmao = dataInfo["ganmao"] as! String
            
            self.use()
        }
    }

    func use(){
        lbTime.text = time
        lbCity.text = "城市：" + city
        lbprovince.text = "省份：" + province
        lbUpdate.text = "更新时间：" + date
        lbTemper.text = "温度：" + wendu
        lbShidu.text = "湿度：" + shidu
        PM.text = "PM25：" + pm25
        lbPm.text = "PM10：" + pm10
        lbQuality.text = "空气质量：" + quality
        lbGanmao.text = "建议：" + ganmao
    }

}

