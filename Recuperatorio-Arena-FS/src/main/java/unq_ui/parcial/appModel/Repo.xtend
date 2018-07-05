package unq_ui.parcial.appModel

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.exceptions.UserException

@Accessors
class Repo {
		
			var List<Contacto> contactos = newArrayList();
			//var List<Contacto> resultado = newArrayList()
			
			
			new(){
					boostrap;
			}
			
			
				
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
								nombre = "Quiero"
								apellido = "Vacaciones"
								email = "traemeLaCoMessi@gmail.com"
								telefono = 1122228889
								];	
								
	def boostrap(){
			
			this.contactos.add(this.contactoMauro)
			this.contactos.add(this.contactoColo);
			this.contactos.add(this.contactoLisa);
			this.contactos.add(this.contactoAprobameWacho);
				
			
		}	
		
	def agregarContacto(Contacto contacto){
		validarContactosDuplicados(contacto)
		contactos.add(contacto)
		
		}
			
	def void validarContactosDuplicados(Contacto contacto) {
		val nombre = contacto.nombre
		val apellido = contacto.apellido
		if (! this.mismoContacto(nombre, apellido).isEmpty ) {
			throw new UserException("El contacto ya se encuentra en la agenda")
		}	contacto.validar
	}
	
	
		
	def mismoContacto(String nombre, String apellido) {
		contactos.filter[contacto | (nombre == contacto.nombre) && (apellido == contacto.apellido)].toList
	}
	
//	def search(String nombre) {
//		
//		if(nombre == null){
//					resultado = contactos
//		}
//		else{
//			resultado =	contactos.filter[contacto | (nombre == contacto.nombre) && (nombre == contacto.apellido)].toList
//			
//		}
//		}
		
		
			
}
