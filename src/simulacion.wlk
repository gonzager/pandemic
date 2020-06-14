import manzana.*
import persona.*

object simulacion {
	var diaSimularion = 0
	const manzanas = []
	
	method addManzana(unaManzana) {
		manzanas.add(unaManzana)
	}
	
	method simularInfeccion() {
		manzanas.forEach( { manzana => manzana.simularInfeccion(diaSimularion)})
		diaSimularion +=1
	}
	
	method addPersonaInfectada() {
		manzanas.anyOne().addPersona(new Persona(estadoPersona= new EstadoPersona(infectada=true)))
	}
	
}


