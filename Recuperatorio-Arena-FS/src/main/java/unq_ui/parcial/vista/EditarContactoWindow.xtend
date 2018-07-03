package unq_ui.parcial.vista

import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.windows.WindowOwner
import unq_ui.parcial.appModel.Contacto
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.NumericField
import unq_ui.parcial.appModel.ContactosAppModel

class EditarContactoWindow extends TransactionalDialog<Contacto> {

	
	new(WindowOwner owner, Contacto model) {
		super(owner, model)
		
	}
	
	override protected createFormPanel(Panel mainPanel) {
		title = " Editar Contacto"
		 new Label(mainPanel).text = "Nombre"
		 
		 new TextBox(mainPanel) =>[
		 		value <=> "nombre"
		 ]
		 
		 new Label(mainPanel).text="Apellido"
		 
		 new TextBox(mainPanel) =>[
		 		value <=> "apellido"
		 ]
		 
		 new Label(mainPanel).text = "email"
		 
		 new TextBox(mainPanel) => [
		 		value <=> "email"
		 ]
		 
		 new Label(mainPanel).text = "Telefono"
		 
		 new NumericField(mainPanel) => [
		 			value <=> "telefono"
		 	]
		 }
		 
		 override protected void addActions(Panel actions) {
		new Button(actions) => [
			caption = "Aceptar"
			onClick [|this.accept]
			
			setAsDefault
			disableOnError	
		]

		new Button(actions) => [
			caption = "Cancelar"	
			onClick [|
				this.cancel
			]
		]
	}
		 
		 
	
} 