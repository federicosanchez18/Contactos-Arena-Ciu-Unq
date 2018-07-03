package unq_ui.parcial.appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.Entity

@Observable
@Accessors
class Contacto extends Entity {
	
	
	var	String nombre;
	var	String apellido;
	var	String email;
	var	Integer telefono;
	var Boolean esFavorito = false;
	
	def contactoFavorito(){
		this.esFavorito = true;
	}
	
	def noContactoFavorito(){
		this.esFavorito = false;
	}
	
	def favorito(){
		if(this.esFavorito){
				this.noContactoFavorito();
		}
		else{
			this.contactoFavorito();
		}
	}
}

	