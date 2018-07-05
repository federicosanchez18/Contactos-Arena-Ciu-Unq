package unq_ui.parcial.appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.exceptions.UserException
import java.util.regex.Pattern

@Observable
@Accessors
class Contacto extends Entity {
	
	
	var	String nombre;
	var	String apellido;
	var	String email;
	var	Integer telefono;
	var Boolean esFavorito = false;
	static final int MIN_NUMERO_TELEFONO = 10000000
	
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
	
	def validar() {
		
		validarCampoVacio("nombre",nombre);
		validarCampoVacio("apellido",apellido);
		validarCampoVacio("email",email);
		
		if (esMailInvalido(email)) {
			throw new UserException("Ingrese un e-mail válido")
		}
		
		if(telefono === null ){
			throw new UserException("Ingrese un telefono celular")
		}
		if (esTelefonoInvalido(telefono)) {
			throw new UserException("Ingrese un telefono válido")
		}
		
	}
	
	def validarCampoVacio(String campo, String aComprobar){
		if (aComprobar === null || aComprobar.trim().equals("")) {
			throw new UserException("Debe ingresar un " + campo)
		}
	}
	
	def esMailInvalido(String email) {
		val emailRegex = ("^.+@.+\\..+$");
        val pat = Pattern.compile(emailRegex);
        return ! pat.matcher(email).matches();
	}
	
	def esTelefonoInvalido(Integer tel) {
        return tel < MIN_NUMERO_TELEFONO    
	}
	
}

	