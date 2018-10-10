//
//  ViewController.swift
//  WeatherApp
//
//  Created by Angela Yu on 23/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON


class WeatherViewController: UIViewController,CLLocationManagerDelegate,changeCityDelegate {
    
    
    
    //Constants
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    let APP_ID = "6b4f00ab341880ead03e8b0542a71e00"
    

    //TODO: Declare instance variables here
    let locationManager = CLLocationManager()
    let model = WeatherDataModel()
    

    
    //Pre-linked IBOutlets
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //TODO:Set up the location manager here.
    
        locationManager.delegate=self
        locationManager.desiredAccuracy=kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        /*
         getting data from system preference
        */
//        if let city = UserDefaults.standard.string(forKey: "city"){
//            cityLabel.text = city
//        }
//        if let temp = UserDefaults.standard.string(forKey: "temp"){
//            temperatureLabel.text = temp
//        }
//        if let weatherimage = UserDefaults.standard.string(forKey: "image"){
//            weatherIcon.image = UIImage(named: weatherimage)
//        }
        
    }
    
    
    
    //MARK: - Networking
    /***************************************************************/
    
    //Write the getWeatherData method here:
    
    func getWeatherData(url: String, parameters: [String: String]) {
        
        Alamofire.request(url , method : .get , parameters : parameters).responseJSON{
            response in
            if response.result.isSuccess{
//                  print("Success! Got the weather data")
                    let weatherJSON : JSON = JSON(response.result.value!)
//                  print(weatherJSON)
                
                    self.updateWeatherData(json: weatherJSON)
                
            }
            else {
                print("Error \(String(describing: response.result.error))")
                self.cityLabel.text = "Connection Issues"
            }
        }
        
    }
    

    
    
    
    
    
    //MARK: - JSON Parsing
    /***************************************************************/
   
    
    //Write the updateWeatherData method here:
    func updateWeatherData(json : JSON){
        
        if let tempValue = json["main"]["temp"].double{
            
            model.tempareture = Int(tempValue - 273.15)
            model.city = json["name"].stringValue
            model.condition = json["weather"][0]["id"].intValue
            model.weatherIcon = model.updateWeatherIcon(condition: model.condition)
            
            updateUIWithWeatherDataModel()
        }
        else {
            cityLabel.text="Weather Unavailable"
        }
        
        
    }
    

    
    
    
    //MARK: - UI Updates
    /***************************************************************/
    
    //Write the updateUIWithWeatherData method here:
    
    func updateUIWithWeatherDataModel()  {
        cityLabel.text = model.city
        temperatureLabel.text = String(model.tempareture)+"°"
        weatherIcon.image = UIImage(named: model.weatherIcon)
        
        
        //saving data to system preferences
//        let store = UserDefaults.standard
//        store.set(temperatureLabel.text!, forKey: "temp")
//        store.set(cityLabel.text!, forKey: "city")
//        store.set(model.weatherIcon, forKey: "image")
        
    }
    
    
    
    
    //MARK: - Location Manager Delegate Methods
    /***************************************************************/
    
    
    //Write the didUpdateLocations method here:
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location=locations[locations.count-1]
        
        if location.horizontalAccuracy>0 {
            
            locationManager.stopUpdatingLocation()
            locationManager.delegate=nil
            
//            print("latitude \(location.coordinate.latitude) \n longititude \(location.coordinate.longitude)")
            
            let latitute = String(location.coordinate.latitude)
            let longitude = String(location.coordinate.longitude)
            
            let params : [String : String] = ["lat" : latitute, "lon": longitude, "appid": APP_ID]
            
            getWeatherData(url: WEATHER_URL, parameters: params)
        }
    }
    
    
    //Write the didFailWithError method here:
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        cityLabel.text="Location Unavailable"
    }
    
    

    
    //MARK: - Change City Delegate methods
    /***************************************************************/
    
    
    //Write the userEnteredANewCityName Delegate method here:
    func userEnteredANewCityName(city: String) {
        
        let params : [String : String] = ["q" : city , "appid" : APP_ID]
        getWeatherData(url: WEATHER_URL, parameters: params)
    }

    
    //Write the PrepareForSegue Method here
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "changeCityName"{
           let destinationVc = segue.destination as! ChangeCityViewController
            destinationVc.delegate = self
        }
    }
    
    
    
}


