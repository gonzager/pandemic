import persona.*

class Manzana {
	var property position 
	var property image = "blanco.png"
	const property personas = []
	
	method addPersonas() {
		10.times { 
			n => personas.add(new Persona())
		}
	}
	
	method addPersona(persona) {
		personas.add(persona)
		image = self.colorEstado()
	}
	
	method cantidPersonasInfectadaNoAislada(){
		return personas.filter({p => p.estaInfectadaNoAislada()}).size()
	}

	method cantidadPersonasInfectadas() {
		return personas.filter({p => p.estaInfectada()}).size()
	}
	
	method cantidadPersonasInfectadasConSisntomas(){
		return personas.filter ({ p => p.estaInfectada() and p.estaInfectadaConSintomas()}).size()
	}

	method personasNoInfectadas() {
		return personas.filter ( { p => not p.estaInfectada() })
	}

	method ciclosInfeccionPorPersona(cantidadDeCiclosPorPersona, persona, dia) {
		cantidadDeCiclosPorPersona.times {
			n=>persona.cicloInfeccion(dia)
		}
	}
	
	method aislarInfectadosConSintomas() {
		personas.filter { p => p.estaInfectadaConSintomas() }
				.forEach{ p => p.aislar() }
	}
	

	
	method simularInfeccion(dia){
		const cantidadInfectadaNoAislada = self.cantidPersonasInfectadaNoAislada()
		self.personasNoInfectadas().forEach{
			p => self.ciclosInfeccionPorPersona(cantidadInfectadaNoAislada, p, dia)
		}
		image = self.colorEstado()
	}
	
	method colorEstado() {
		const cantidad = self.cantidadPersonasInfectadas()
		if (cantidad == 0) return "blanco.png"
		else if (cantidad.between(1,3)) return "amarillo.png"
		else if (cantidad.between(4,7)) return "dorado.png"
		else if (cantidad.between(8, personas.size()-1)) return "naranja.png"
		else (cantidad == personas.size()) return "rojo.png"
	}
}


