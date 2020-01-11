//
//  ViewController.swift
//  UIKIT VISUAL COMPONENTS
//
//  Created by Syed.Reshma Ruksana on 9/6/19.
//  Copyright © 2019 Syed.Reshma Ruksana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    //below are the global variables declared
    
    var URLReqObj:URLRequest!
    var dataTaskObj:URLSessionDataTask!
    var enterButton:UIButton!
    var stateNames:UILabel!
    var citiesName:UILabel!
    var quoteNames:UILabel!
    var quoteDisplay:UITextField!
    var firstName:UILabel!
    var lastName:UILabel!
    var firstNameDisplay:UITextField!
    var lastNameDisplay:UITextField!
    var stateNameText:UITextField!
    var statesData:[String]!
    var citiesNameText:UITextField!
    var citiesData:[String]!
    var actorsData:[String]!
    var actorsNames:UILabel!
    var actorsDisplay:UITextField!
    var quoteData:[String]!
    var gender:UISegmentedControl!
    var genderText:UILabel!
    var age:UISlider!
    var ageText:UILabel!
    var maritalStatus:UISwitch!
    var maritalStatus1:UILabel!
    var noOfPersons:UIStepper!
    var noOfPersonsText:UILabel!
    var actorElementYPos:Int!
    var quoteElementYPos:Int!
    
    //below are the declared dimensions in Simulator
    
    let gap=50
    let leftSideElementsXPos=30
    let rightSideElementXPos=150
    var YValue=40
    var commonWidthRight=250
    let heightOfAllObjects=40
    let commonWidthLeft=140
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
     //STATES
        
        indiaStatesDetails() //func call
        
        while statesData == nil {
            print("CONNECTING WITH SERVER")
        }
        
        stateNames=UILabel()
        stateNames.frame=CGRect(x: leftSideElementsXPos , y: YValue, width: commonWidthLeft, height: heightOfAllObjects)
        stateNames.textColor=UIColor.red
        stateNames.text="States:"
        view.addSubview(stateNames)
        
        stateNameText=UITextField()
        stateNameText.frame=CGRect(x: rightSideElementXPos, y: YValue, width: commonWidthRight, height: heightOfAllObjects)
        stateNameText.text="\(statesData!)"
        view.addSubview(stateNameText)
        
        
      //CITIES
        
        indiaCitiesDetails()
        while citiesData == nil {
            print("CONNECTING WITH SERVER")
        }
        
        YValue+=gap
        citiesName=UILabel()
        citiesName.frame=CGRect(x: leftSideElementsXPos , y: YValue, width: commonWidthLeft, height: heightOfAllObjects)
        citiesName.textColor=UIColor.red
        citiesName.text="Cities:"
        view.addSubview(citiesName)
        
        citiesNameText=UITextField()
        citiesNameText.frame=CGRect(x: rightSideElementXPos, y: YValue, width: commonWidthRight, height: heightOfAllObjects)
        citiesNameText.text="\(citiesData!)"
        view.addSubview(citiesNameText)
        
     //ACTORS
        
        actorDetails() //func call
        while actorsData == nil {
            print("actors")
        }
        
        YValue+=gap
        actorsNames=UILabel()
        actorsNames.frame=CGRect(x: leftSideElementsXPos , y: YValue, width: commonWidthLeft, height: heightOfAllObjects)
        actorsNames.textColor=UIColor.red
        actorsNames.text="Actor :"
        view.addSubview(actorsNames)
        
        actorsDisplay=UITextField()
        actorsDisplay.frame=CGRect(x: rightSideElementXPos, y: YValue, width: commonWidthRight, height: heightOfAllObjects)
        actorsDisplay.text="\(actorsData!)"
        view.addSubview(actorsDisplay)
        
    //QUOTES
        
        quoteDetails() //func call
        while quoteData == nil {
            print("Quotes")
        }
        YValue+=gap
        quoteNames=UILabel()
        quoteNames.frame=CGRect(x: leftSideElementsXPos , y: YValue, width: commonWidthLeft, height: heightOfAllObjects)
        quoteNames.textColor=UIColor.red
        quoteNames.text="Quote :"
        view.addSubview(quoteNames)
        
        quoteDisplay=UITextField()
        quoteDisplay.frame=CGRect(x: rightSideElementXPos, y: YValue, width: commonWidthRight, height: heightOfAllObjects)
        quoteDisplay.text="\(quoteData!)"
        view.addSubview(quoteDisplay)
        
    //FIRST NAME
        
        YValue+=gap
        firstName=UILabel()
        firstName.frame=CGRect(x: leftSideElementsXPos, y: YValue, width: commonWidthLeft, height: heightOfAllObjects)
        firstName.textColor=UIColor.red
        firstName.text="FirstName :"
        view.addSubview(firstName)
        
        firstNameDisplay=UITextField()
        firstNameDisplay.frame=CGRect(x: rightSideElementXPos, y: YValue, width: commonWidthRight, height: heightOfAllObjects)
        firstNameDisplay.placeholder="Enter your First Name"
        view.addSubview(firstNameDisplay)

        
   //LAST NAME

        
        YValue+=gap
        lastName=UILabel()
        lastName.frame=CGRect(x: leftSideElementsXPos, y: YValue, width: commonWidthLeft, height: heightOfAllObjects)
        lastName.textColor=UIColor.red
        lastName.text="LastName :"
        view.addSubview(lastName)
        
        
        lastNameDisplay=UITextField()
        lastNameDisplay.frame=CGRect(x: rightSideElementXPos, y: YValue, width: commonWidthRight, height: heightOfAllObjects)
        lastNameDisplay.placeholder="Enter Your Second Name"
        view.addSubview(lastNameDisplay)
        
    //GENDER
        
        YValue+=gap
        genderText=UILabel()
        genderText.frame=CGRect(x: leftSideElementsXPos, y: YValue, width: commonWidthLeft, height: heightOfAllObjects)
        genderText.textColor=UIColor.red
        genderText.text="Gender:"
        view.addSubview(genderText)
        
        var segments=["MALE","FEMALE"]
        gender=UISegmentedControl(items: segments)
        gender.frame=CGRect(x: rightSideElementXPos, y: YValue, width: commonWidthRight, height: heightOfAllObjects)
        view.addSubview(gender)
        
    //AGE
        
        YValue+=gap
        ageText=UILabel()
        ageText.frame=CGRect(x: leftSideElementsXPos, y: YValue, width: commonWidthLeft, height: heightOfAllObjects)
        ageText.textColor=UIColor.red
        ageText.text="Age :"
        view.addSubview(ageText)
        
        age=UISlider()
        age.frame=CGRect(x: rightSideElementXPos, y: YValue, width: commonWidthRight, height: heightOfAllObjects)
        age.backgroundColor=UIColor.blue
        view.addSubview(age)
        
        
    //MARITAL STATUS
        
        YValue+=gap
        maritalStatus1=UILabel()
        maritalStatus1.frame=CGRect(x: leftSideElementsXPos, y: YValue, width: commonWidthLeft, height: heightOfAllObjects)
        maritalStatus1.text="MaritialStatus :"
        maritalStatus1.textColor=UIColor.red
        view.addSubview(maritalStatus1)
        
        maritalStatus=UISwitch()
        maritalStatus.frame=CGRect(x: rightSideElementXPos, y: YValue, width: commonWidthRight, height: heightOfAllObjects)
        view.addSubview(maritalStatus)
        
    //NUMBER OF PERSONS
        
        YValue+=gap
        noOfPersonsText=UILabel()
        noOfPersonsText.text="NoOfPersons :"
        noOfPersonsText.frame=CGRect(x: leftSideElementsXPos, y: YValue, width: commonWidthLeft, height: heightOfAllObjects)
        noOfPersonsText.textColor=UIColor.red
        view.addSubview(noOfPersonsText)
        
        noOfPersons=UIStepper()
        noOfPersons.frame=CGRect(x: rightSideElementXPos, y: YValue, width: commonWidthRight, height: heightOfAllObjects)
        view.addSubview(noOfPersons)
        
    //BUTTON
        
        YValue+=gap
        self.view.backgroundColor=UIColor.green
        enterButton=UIButton(type: UIButtonType.system)
        enterButton.frame=CGRect(x: leftSideElementsXPos+50, y: YValue+50, width: 200, height: 50)
        enterButton.backgroundColor=UIColor.orange
        enterButton.setTitle("SUBMIT", for: UIControlState.normal)
        view.addSubview(enterButton)
        
    }
    
   //STATE DETAILS
    
    func indiaStatesDetails() {
        
        URLReqObj = URLRequest(url:URL(string: "https://www.brninfotech.com/tws/IndiaDetails.php?type=states&quantity=3")!)
        URLReqObj.httpMethod="GET" //using GET method
        
        dataTaskObj=URLSession.shared.dataTask(with: URLReqObj, completionHandler: {data, connDetails, error in
            
            
            
            do{
                self.statesData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String]
                
                print(self.statesData)
                
            }
                
            catch{
                print("something has gone wrong")
            }
            
        })
        
        dataTaskObj.resume()
        
        
        
    }
    
 //CITIES DETAILS
    
    func indiaCitiesDetails() {
        
        URLReqObj = URLRequest(url:URL(string: "https://www.brninfotech.com/tws/IndiaDetails.php?type=cities&quantity=3")!)
        URLReqObj.httpMethod="GET" //using GET method
        
        dataTaskObj=URLSession.shared.dataTask(with: URLReqObj, completionHandler: {data, connDetails, error in
            
            
            
            do{
                self.citiesData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String]
                
                print(self.citiesData)
                
            }
                
            catch{
                print("something has gone wrong")
            }
            
        })
        
        dataTaskObj.resume()
        
        
        
    }
    
   // ACTOR DETAILS
    
    func actorDetails() {
        
        URLReqObj = URLRequest(url:URL(string: "https://www.brninfotech.com/tws/Quotes.php")!)
        URLReqObj.httpMethod="POST"  //Using Post method
        
        var dataToSend="type=actors&quantity=5"
        URLReqObj.httpBody=dataToSend.data(using: String.Encoding.utf8)
        
        dataTaskObj=URLSession.shared.dataTask(with: URLReqObj, completionHandler: {data, connDetails, error in
            print("received the data")
            
            
            do{
                self.actorsData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String]
                print(self.actorsData)
            }
                
            catch{
                print("something has gone wrong")
            }
            
        })
        dataTaskObj.resume()
        
    }
    
   //QUOTES DETAILS
    
    func quoteDetails() {
        
        URLReqObj = URLRequest(url:URL(string: "https://www.brninfotech.com/tws/Quotes.php")!)
        URLReqObj.httpMethod="POST"  //Using Post method
        
        var dataToSend="type=quote&quantity=1"
        URLReqObj.httpBody=dataToSend.data(using: String.Encoding.utf8)
        
        dataTaskObj=URLSession.shared.dataTask(with: URLReqObj, completionHandler: {data, connDetails, error in
            print("received the data")
            
            
            do{
                self.quoteData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String]
                print(self.quoteData)
            }
                
            catch{
                print("something has gone wrong")
            }
            
        })
        dataTaskObj.resume()
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

