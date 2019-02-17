# Takeaway 
# App Structure
 
* App structure I use **MVVM** with **Delegate** to notify about updates.

* I use the **Repository** design pattern to get Data from Offline DataBase.

* Separate the data source of UITableView to other class **TableViewDataSource**.

* I use **CellReusable** protocol and create  extension for UITableView to reduce code when reusing the cell.

* Use DataLoader.swift to get data from local JSON.

* Create Extension for UIIMageView to download the image from the link.

* Create Extension for UITableViewCell to return Empty Cell with an error message.

* I use [JSONExport](https://github.com/Ahmed-Ali/JSONExport) to generate model from JSON.


## Note
The task is written in **Gherkin Language** ,that inspire me to apply BDD using Quick and Nimble but 3rd party frameworks not allowed.

# UnitTest
* I apply  **Arrange, Act and Assert (AAA) Pattern** in Unit Testing.
* Test get data from JSON and Save it to Database.
* Test **ViewModel**.
* Test **ViewController**.
* Test **Sort Logic**.


 # Install The project 
 
 In the path of the project run this command 
 
 `pod install`
 
 Then you can run the workspace "Takeaway.xcworkspace"
