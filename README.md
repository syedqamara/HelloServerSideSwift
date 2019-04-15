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
</center>


# Introduction 
To built your web-application with Swift you need to first install its framework. There are some Swift frameworks available 

1: Vapor

2: Perfect

3: Kitura

# Vapor
 But this repo used Swift with Vapor. To use vapor you need to have Vapor installed on your machine & Xcode should be installed too.  
 
## Install Vapor  
 
 To install Vapor use bellow commands.  
 
```brew tap vapor/tap```

```brew install vapor/tap/vapor```

## Create New Project
Now go to your desired directory where you want to create a new Project. And paste the following command.

### Vapor Project

```vapor new YourProjectName```

Once that finishes, change into the newly created directory.


```cd YourProjectName```

### Generate Xcode Project

Let's now use the Vapor Toolbox's Ccode command to generate an Xcode project. This will allow us to build and run our app from inside of Xcode, just like an iOS app.

```vapor xcode```


To build either you can use command or Xcode’s Play button at the top left. (But you need to choose ```Run``` from your provided targets.)


