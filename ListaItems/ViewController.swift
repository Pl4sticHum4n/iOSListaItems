//
//  ViewController.swift
//  ListaItems
//
//  Created by mac16 on 14/03/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var alumnos = [Alumno(nombre: "Marco", calificacion: 90)]
    var alumnoSeleccionado: String?
    var califSeleccionado: Int?
    
    @IBOutlet weak var tablaItems: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tablaItems.delegate = self
        tablaItems.dataSource = self
    }
    
    @IBAction func agreagarNuevo(_ sender: UIBarButtonItem) {
        print("Agregar")
        let alerta = UIAlertController(title: "Nuevo Contacto", message: "Agregar", preferredStyle: .alert)
        
        // Add text field
        alerta.addTextField { nombreAlerta in
            nombreAlerta.placeholder = "Escribe un nuevo nombre"
        }
        
        alerta.addTextField { calificacionAlerta in
            calificacionAlerta.placeholder = "Ingresa la calificacion"
            calificacionAlerta.keyboardType = .numberPad
        }
        
        let accionAceptar = UIAlertAction(title: "Aceptar", style: .default) { _ in
            // guard let
            guard let nombreAlumno = alerta.textFields?.first?.text else {return}
            guard let calificacionAlumno = alerta.textFields?[1].text else {return}
            
            // crear objeto
            let nuevoAlumno = Alumno(nombre: nombreAlumno, calificacion: Int(calificacionAlumno) ?? 0)
            self.alumnos.append(nuevoAlumno)
            print(self.alumnos)
            
            print("Alumno agregado")
            
            //actualizar la tabla
            self.tablaItems.reloadData()
        }
        
        let accionCancelar = UIAlertAction(title: "Cancelar", style: .destructive, handler: nil)
        
        alerta.addAction(accionAceptar)
        alerta.addAction(accionCancelar)
        
        present(alerta, animated: true, completion: nil)
    }
    //MARK: Metodos de la UITABLEVIEW
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alumnos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Crear objeto del tipo UITableviewCell
        let celda = tablaItems.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        celda.textLabel?.text = alumnos[indexPath.row].nombre
        celda.detailTextLabel?.text = String(alumnos[indexPath.row].calificacion ?? 0)
        return celda
    }
    
    // Eliminar elemento
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            alumnos.remove(at: indexPath.row)
            print("Nombre eliminado")
            //actualizar la tabla
            self.tablaItems.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(alumnos[indexPath.row])
        alumnoSeleccionado = alumnos[indexPath.row].nombre
        califSeleccionado = alumnos[indexPath.row].calificacion
        //Mandar elemento seleccionado a segundo View Controller
        performSegue(withIdentifier: "enviarNombre", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let objetoDestino = segue.destination as! VistaDetalladaViewController
        objetoDestino.recibirNombre = alumnoSeleccionado
        objetoDestino.recibirCalificacion = califSeleccionado
    }
    
}

