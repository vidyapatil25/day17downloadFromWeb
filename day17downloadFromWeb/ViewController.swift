//
//  ViewController.swift
//  day17downloadFromWeb
//
//  Created by Felix-ITS016 on 20/12/19.
//  Copyright © 2019 Felix. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func download(_ sender: UIButton) {
        let queue = DispatchQueue(label: "serialqueue")
        queue.async{
            self.downLoadImage()
        }
        let queue1 = DispatchQueue(label: "concurrent",attributes: .concurrent)
        queue1.sync
            {
                self.downLoadImage()
            }
       }
    
    func downLoadImage()
    {
        let str = "https://images.pexels.com/photos/33109/fall-autumn-red-season.jpg?auto=compress&cs=tinysrgb&dpr=1&w=500"
        let url = URL (string: str)
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            let image = UIImage(data: data!)
             DispatchQueue.main.async
                {
            self.imageView.image = image
            }
           
        }
        dataTask.resume()
    }


override func viewDidLoad()
{
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

