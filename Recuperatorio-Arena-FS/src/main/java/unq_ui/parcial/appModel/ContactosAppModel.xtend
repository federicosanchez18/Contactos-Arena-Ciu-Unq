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
					boostrap();
			
		
	}
	
		
	
	var List<Contacto> contactos = newArrayList();
	var Contacto contactoSeleccionado;
	var Contacto example = new Contacto;
	
	var Contacto contactoLisa = new Contacto() => [
								nombre = "Lisa"
								apellido = "Romero"
								email = "lisa@gmail.com"
								telefono = 1133445566
							];
	var Contacto contactoMauro = new Contacto() => [
								 nombre = "Mauro"
								 apellido= "Marino"
								 email= "mauro@gmail.com"
								 telefono = 1144556677
								]; 	
	var Contacto contactoColo = new Contacto() => [
								nombre =  "Jose"
								apellido = "Sanchez"
								email = "colo@gmail.com"
								telefono = 1199887766
								];
	var Contacto contactoAprobameWacho = new Contacto() =>[
								nombre = "Aprobrame"
								apellido = " Wacho"
								email = "traemeLaCoMessi@gmai.com"
								telefono = 1122228889
								];																		
							
		
	
	
	def boostrap() {
		 	this.contactos.add(this.contactoMauro)
			this.contactos.add(this.contactoColo);
			this.contactos.add(this.contactoLisa);
			this.contactos.add(this.contactoAprobameWacho);
	}
	
	
	def agregarContacto(){
			contactos.add(this.example);
			this.example = new Contacto()
			this.update;
	}
	
	def validarCreacion() {
		if(contactoSeleccionado.nombre === null || contactoSeleccionado.nombre == "") {throw new UserException("Completar nombre")}
		if(contactoSeleccionado.apellido === null ||contactoSeleccionado.apellido == "") {throw new UserException("Completar apellido")}
		if(contactoSeleccionado.email === null || contactoSeleccionado.email == ""){throw new UserException("Completar email")}	
		if(!contactoSeleccionado.email.contains("@")) {throw new UserException("agregar arroba en tu email")};
			
		
	
	}
	
	
	def update(){
		
		ObservableUtils.firePropertyChanged(this, "contactos")
		 
	}

	
	
	
	
}	