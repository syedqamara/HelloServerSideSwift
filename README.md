<p align="center">
    <img src="https://user-images.githubusercontent.com/1342803/36623515-7293b4ec-18d3-11e8-85ab-4e2f8fb38fbd.png" width="320" alt="API Template">
    <br>
    <br>
    <a href="http://docs.vapor.codes/3.0/">
        <img src="http://img.shields.io/badge/read_the-docs-2196f3.svg" alt="Documentation">
    </a>
    <a href="https://discord.gg/vapor">
        <img src="https://img.shields.io/discord/431917998102675485.svg" alt="Team Chat">
    </a>
    <a href="LICENSE">
        <img src="http://img.shields.io/badge/license-MIT-brightgreen.svg" alt="MIT License">
    </a>
    <a href="https://circleci.com/gh/vapor/api-template">
        <img src="https://circleci.com/gh/vapor/api-template.svg?style=shield" alt="Continuous Integration">
    </a>
    <a href="https://swift.org">
        <img src="http://img.shields.io/badge/swift-4.1-brightgreen.svg" alt="Swift 4.1">
    </a>
    <a href="https://www.facebook.com/syedqamar.a">
        <img src="http://img.shields.io/badge/Developer-Syed_Qamar-iOS.svg" alt="Swift 4.1">
    </a>
</center>


# Introduction 
To built your web-application with Swift you need to first install its framework. There are some Swift frameworks available 

1: Vapor

2: Perfect

3: Kitura

# Deployed APIS
Master branch of this repo is deployed on `Heroko`. You can test the deployed apis by reading the <a href=https://documenter.getpostman.com/view/1828110/S17kyB1R>Documentation </a>.

# Vapor
 But this repo used Swift with Vapor. To use vapor you need to have Vapor installed on your machine & Xcode should be installed too.  
 
## Install Vapor  
 
 To install Vapor use bellow commands.  
 
``` bash
brew tap vapor/tap
```

``` bash
brew install vapor/tap/vapor
```

## Create New Project
Now go to your desired directory where you want to create a new Project. And paste the following command.

### Vapor Project

``` bash 
vapor new YourProjectName
```

Once that finishes, change into the newly created directory.


``` bash
cd YourProjectName
```

### Generate Xcode Project

Let's now use the Vapor Toolbox's Ccode command to generate an Xcode project. This will allow us to build and run our app from inside of Xcode, just like an iOS app.

``` bash
vapor xcode
```

### Create Database.

For creating database with `PostgreSQL` <a href="entertainer://newOrderRecieved=1234">
        <img src="https://img.shields.io/badge/Download-PostgreSQL-f47139.svg" alt="Download"></img>
    </a> and then below steps.
    


    1: Download
    2: Install
    3: Initialze


After initialzing double click default database and it will open `terminal` just paste below lines and your database will be created.

``` sql
CREATE DATABASE YourDatabaseName;
```

Now in your `configure.swift` file replace `username` with your selected database name on which you have double clicked and `database` name with **YourDatabaseName**.

### Build

To build either you can use command or Xcode’s Play button at the top left. (But you need to choose ```Run``` from your provided targets.

# Contributions
Primary contributors for this repository are following. But we thanks to all of those who read/fork/raise an issue on this repo, because without there contribution we won't be able to stabalise it.

<a href=mailto://syedqamar.a1@gmail.com> Syed Qamar Abbas</a>

<a href=mailto://umairsharif99@gmail.com> Umair Sharif</a>

<a href=http://entertainer://newOrderRecieved=1234> Click Here </a>

