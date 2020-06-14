
class Persona {
	var property estadoPersona = new EstadoPersona()
	
	method puedeInfectarse() {
		const umbral = if (estadoPersona.respetaCuarentena()){2} else {30}
		const random = 0.randomUpTo(100).truncate(0)
		return random <= umbral	
	}

	method puedeTenerSintomas(){
		const umbral = 20
		const random = 0.randomUpTo(100).truncate(0)
		return random <= umbral			
	}

	method cicloInfeccion (dia) {
		const puedeInfectarse = self.puedeInfectarse()
		if ( not estadoPersona.infectada() and puedeInfectarse) {
			estadoPersona.diaQueSeInfecto(dia)
			estadoPersona.infectada(puedeInfectarse)
			estadoPersona.sintomas(puedeInfectarse and self.puedeTenerSintomas())
		} 
	}
	
	method aislar() = estadoPersona.aislada(true)
	
	method estaInfectadaNoAislada() = estadoPersona.estaInfectadaNoAislada()
	method estaInfectada() = estadoPersona.infectada()
	method estaInfectadaConSintomas() = estadoPersona.estaInfectadaConSintomas()
}

class EstadoPersona {
	var property infectada = false
	var property sintomas = false
	var property aislada = false
	var property respetaCuarentena = false
	var property diaQueSeInfecto = 0
	
	method estaInfectadaNoAislada() = infectada and not aislada
	method curarse() {
		infectada= false
		sintomas = false
		diaQueSeInfecto = 0
	}
	method estaInfectadaConSintomas() = infectada and sintomas

}