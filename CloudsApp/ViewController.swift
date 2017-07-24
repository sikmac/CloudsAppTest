import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        Alamofire.request("https://api.github.com/users/octocat/repos").responseJSON { response in
            if let result_value = response.result.value {
                if let array = result_value as? [Any] {
                    if let JSON_OBJECT = array.first {
                        if let dictionary = JSON_OBJECT as? [String: Any] {
                            if let value = dictionary["id"] as? Int {
                                print("id: \(value)")
                            }
                            
                            if let value = dictionary["name"] as? String {
                                print("name: \(value)")
                            }
                            
                            if let value = dictionary["full_name"] as? String {
                                print("full_name: \(value)")
                            }
                            
                            if let value = dictionary["private"] as? Bool {
                                print("private: \(value)")
                            }
                            
                            for (key, value) in dictionary {
                                if let valueString = value as? String {
                                    print(key + ":" + valueString)
                                }
                                
                            }
                        }
                    }
                }
            }
        
        Alamofire.request("https://httpbin.org/get").responseJSON { response in
            print(response.request as Any)
            print(response.response as Any)
            print(response.data as Any)
            print(response.result)
            
            if let array = response.result.value {
                print("準備印出result中的資料")
                print(array)
            }
            
            if let JSON = response.result.value {
                if let dictionary = JSON as? [String:Any] {
                    if let value = dictionary["origin"] as? String {
                        print("解出key為origin的值")
                        print(value)
                        
                        if let headersDictionary = dictionary["headers"] as? [String: Any] {
                            for (key, value) in headersDictionary {
                                if let valueString = value as? String {
                                    print(key + ":" + valueString)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
}
