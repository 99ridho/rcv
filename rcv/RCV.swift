//
//  RCV.swift
//  RCV
//
//  Created by Muhammad Ridho on 4/24/17.
//

import UIKit

// This struct represents your message
struct RCVMessage {
    var senderName: String
    var message: String
    var isSentByMe: Bool
    var time: String
    
    init(senderName: String, message: String, time: String, isSentByMe: Bool) {
        self.senderName = senderName
        self.message = message
        self.isSentByMe = isSentByMe
        self.time = time
    }
}

// This class represents your message cell
class RCVMessageTableViewCell: UITableViewCell {
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var senderNameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
}

class RCVViewController: UIViewController {
    
    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var messageTextField: UITextField!
    
    // table view data sources
    // append your RCVMessage instance here after sending/receiving
    var messages = [RCVMessage]()
    
    let myName = "Me"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        chatTableView.delegate = self
        chatTableView.dataSource = self
    }

    // Message sending handler
    // Configure by yourself according to your needs
    @IBAction func buttonSendTapped(_ sender: UIButton) {
        if !messageTextField.text!.isEmpty {
            let df = DateFormatter()
            df.dateFormat = "HH:mm"
            
            let msg = RCVMessage(
                senderName: myName,
                message: messageTextField.text!,
                time:  df.string(from: Date()),
                isSentByMe: true
            )
            
            messages.append(msg)
            messageTextField.text = ""
            chatTableView.reloadData()
        }
    }
    
    // Receive message handler
    // Configure by yourself according to your needs
    func receiveMessage() {
        // do something
        // you can receive your message via another layer which responsible to handle messaging, then make RCVMessage instance with isSentByMe = false
    }
    
}

extension RCVViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! RCVMessageTableViewCell
        cell.senderNameLabel.text = messages[indexPath.row].senderName
        cell.messageLabel.text = messages[indexPath.row].message
        cell.time.text = messages[indexPath.row].time
        
        if messages[indexPath.row].isSentByMe {
            cell.senderNameLabel.textColor = UIColor.red
        }
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
}
