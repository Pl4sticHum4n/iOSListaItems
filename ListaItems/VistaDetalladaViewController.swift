//
//  VistaDetalladaViewController.swift
//  ListaItems
//
//  Created by mac16 on 14/03/22.
//

import UIKit

class VistaDetalladaViewController: UIViewController {

    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var nombreAlumnoLabel: UILabel!
    
    var recibirNombre: String?
    var recibirCalificacion: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nombreAlumnoLabel.text = "\(recibirNombre ?? ""), sacaste \(recibirCalificacion ?? 0)"
        if recibirCalificacion! >= 70 {
            imagen.image = UIImage(named: "1")
        } else {
            imagen.image = UIImage(named: "2")
        }
        // Do any additional setup after loading the view.
    }

    
}
