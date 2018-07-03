package unq_ui.parcial.vista


import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Table

import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.layout.HorizontalLayout

import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.NumericField
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.bindings.NotNullObservable
import unq_ui.parcial.appModel.ContactosAppModel
import unq_ui.parcial.appModel.Contacto
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.windows.WindowOwner

class ContactosWindow extends TransactionalDialog<ContactosAppModel> {
	 
//	new() {
//		super(new ContactosAppModel())
//		
//	}

	new(WindowOwner owner, ContactosAppModel model) {
		super(owner, model)
        }


	
	
	
	
	override createFormPanel(Panel mainPanel) {
			mainPanel.layout = new HorizontalLayout();
		
			
			this.title = "Contactos";
			var panelIzquierda = new Panel (mainPanel)
			var panelDerecha = new Panel (mainPanel)
			this.panelLeft(panelIzquierda);
			this.panelRight(panelDerecha)
				
		
	}
	def panelLeft(Panel mainPanel){
			
			this.createGrillaContactos( mainPanel)
			new Button(mainPanel) =>[
				caption = "Favorito"
				onClick [modelObject.contactoSeleccionado.favorito()]
				bindEnabled(new NotNullObservable("contactoSeleccionado"))
				setAsDefault
				disableOnError
				]
				
			new Button(mainPanel) =>[
				caption = "Editar"
				onClick[this.modificarSerie]
				bindEnabled(new NotNullObservable("contactoSeleccionado"))
				setAsDefault
				disableOnError
				
			]	
	}
	
	def panelRight(Panel mainPanel){
		 	
		 	
		 	mainPanel.layout = new ColumnLayout(2)
		 	
		 	new Label(mainPanel).text = "Nuevo Contacto"
		 	new Label(mainPanel);
		 	
		
			new Label(mainPanel).text = "Nombre"
			new TextBox(mainPanel) => [
				width =  200
				value <=> "example.nombre"
				]
				
			
			new Label(mainPanel).text = "Apellido"
			new TextBox(mainPanel) => [
				width =  200
				value <=> "example.apellido"
				]
				
			new Label(mainPanel).text = "Email"
			new TextBox(mainPanel) => [
				width =  200
				value <=> "example.email"
				]
				
			new Label(mainPanel).text = "Telefono"
			new NumericField(mainPanel) => [
				width =  200
				value <=> "example.telefono"
				]		
				
			new Button(mainPanel)=>[
				caption = "Crear Contacto"
				onClick[agregar]
				modelObject.update;
				bindEnabled(new NotNullObservable("example"))
				setAsDefault
				disableOnError
				
			]
			
	}
	
	def agregar(){
		this.modelObject.validarCreacion
		this.modelObject.agregarContacto;
	}
	
	
	def createGrillaContactos(Panel mainPanel) {
		val gridContactos = new Table(mainPanel, typeof(Contacto)) => [
			width = 400
			numberVisibleRows = 5
			items <=> "contactos"
			bindValueToProperty("contactoSeleccionado");
		]
		
		new Column<Contacto>(gridContactos) => [
			fixedSize = 200
			title = "Nombre y apellido"
			bindContentsToProperty("nombre")
		]
		
		new Column<Contacto>(gridContactos) => [
			fixedSize = 200
			title = "Favorito"
			bindContentsToProperty("esFavorito")
		]
		
		
		}
		
	def void modificarSerie() {
		new EditarContactoWindow(this, modelObject.contactoSeleccionado) => [
			onAccept[this.modelObject.update]
			onCancel[]
			open
			]
	}	
		
	
	def update(){
		this.modelObject.update;
	}
	
		
}	
