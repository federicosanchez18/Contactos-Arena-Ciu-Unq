package unq_ui.parcial.appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import java.util.List
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.utils.ObservableUtils
import org.uqbar.commons.model.exceptions.UserException

@Accessors
@TransactionalAndObservable
class ContactosAppModel {

			new(){
					update();
			
		
	}
	
		
	
	var List<Contacto> contactos = newArrayList();
	var Contacto contactoSeleccionado;
	var Contacto example = new Contacto;
	var Repo home = new Repo()
	var String busqueda = ""
	var List<Contacto> resultado
	
		
	
	
	
	def agregarContacto(){
			home.agregarContacto(this.example);
			this.example = new Contacto()
			this.update;
	}
	
	
	def update(){
		contactos = #[]
		contactos = home.contactos;
	}	
	
	def actualizarDatos(){
		contactoSeleccionado.validar
		this.update()
	}
	
//	def search() {
//		home.search(busqueda)
//		resultado = home.resultado
//		contactos = resultado
//		if(resultado.isEmpty){
//				this.update
//		}
//		
//		
//	}
	
	

	def validarBusqueda(){
		if (busqueda == ""){
			throw new UserException("No se encuentra contacto en la agenda")
		}
	}
	
	
//	def update(){
//		
//		ObservableUtils.firePropertyChanged(this, "contactos")
//		 
//	}

	
	
	
	
}	