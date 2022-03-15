//
//  VistaDetalladaViewController.swift
//  ListaItems
//
//  Created by mac16 on 14/03/22.
//

import UIKit

class VistaDetalladaViewController: UIViewController {

    @IBOutlet weak var nombreAlumnoLabel: UILabel!
    
    var recibirNombre: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        nombreAlumnoLabel.text = recibirNombre ?? ""
        // Do any additional setup after loading the view.
    }

    @IBAction func regresar(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
