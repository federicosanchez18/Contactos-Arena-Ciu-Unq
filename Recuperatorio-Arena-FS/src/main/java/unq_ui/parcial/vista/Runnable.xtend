package unq_ui.parcial.vista

import org.uqbar.arena.Application
import unq_ui.parcial.appModel.ContactosAppModel

class Runnable extends Application {

		
	override protected createMainWindow() {

		new ContactosWindow(this, new ContactosAppModel)

	}


	static def void main(String[] args) {
		new Runnable().start()
	}

}