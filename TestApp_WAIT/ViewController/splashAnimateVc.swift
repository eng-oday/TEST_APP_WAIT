//
//  splashAnimateVc.swift
//  TestApp_WAIT
//
//  Created by Oday Dieg on 22/09/2022.
//

import UIKit

class splashAnimateVc: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.containerView.alpha = 0

    }
    
    override func viewDidLayoutSubviews() {
        DispatchQueue.main.asyncAfter(deadline: .now()+0.1, execute: {
            self.animate()
        })
    }
//
    private func animate()
  {
      UIView.animate(withDuration: 4, delay: 1, options: .curveEaseIn, animations: {
          self.containerView.alpha = 1
      }) { _ in
//          guard let vc = UIStoryboard.init(name: storyBoard.Main, bundle: nil).instantiateViewController(withIdentifier: ViewControllers.loginViewController) as? loginViewController else {return}
//          self.navigationController?.pushViewController(vc, animated: true)
          Helper.restartApp()
      }
    }


}
