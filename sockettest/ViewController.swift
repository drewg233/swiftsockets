//
//  ViewController.swift
//  sockettest
//
//  Created by Drew Garcia on 10/3/15.
//  Copyright © 2015 Drew Garcia. All rights reserved.
//

import UIKit
import Socket_IO_Client_Swift

class ViewController: UIViewController {
    
    let socket = SocketIOClient(socketURL: "localhost:3000")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Define the Sockets
        self.addHandlers()
        // Connect to the Socket
        self.socket.connect()
    }
    
    func addHandlers() {
        self.socket.on("connect") {data, ack in
            print("socket connected")
        }
        self.socket.on("changeBackgroundiOS") {[weak self] data, ack in
            
            if data[0] as! String == "red" {
                self!.view.backgroundColor = UIColor.redColor()
            }
            if data[0] as! String == "blue" {
                self!.view.backgroundColor = UIColor.blueColor()
            }
            if data[0] as! String == "green" {
                self!.view.backgroundColor = UIColor.greenColor()
            }
        }
    }
    @IBAction func greenButton(sender: AnyObject) {
        print("pressed green color!")
        socket.emit("colorPressed", "green")
    }
    @IBAction func blueButton(sender: AnyObject) {
        print("pressed blue color!")
        socket.emit("colorPressed", "blue")
    }
    @IBAction func redButton(sender: AnyObject) {
        print("pressed red color!")
        socket.emit("colorPressed", "red")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

