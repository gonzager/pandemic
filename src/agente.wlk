import direcciones.*

object agenteSalud {
	var property position 
	var property image = "lupa.png"
	var property maxDeracha = 0
	var property maxArriba = 0
	
	var property direccion = arriba
	const inpeccionManzana = inspeccion
	
	method inspeccionar(manzana) {
		inpeccionManzana.infectadas(manzana.cantidadPersonasInfectadas())
		inpeccionManzana.infectadasNoAisladas(manzana.cantidPersonasInfectadaNoAislada())
		inpeccionManzana.infectadasConSintomas(manzana.cantidadPersonasInfectadasConSisntomas())
		return inpeccionManzana
	}
	
	method aislarInfectadosConSintomas(manzana){
		manzana.aislarInfectadosConSintomas()
	}
		
	method irArriba() {
		direccion = arriba
		self.moverte(self.cantidadArriba() )
	}
	method cantidadArriba() = if(maxArriba!=position.y()) {1} else {-maxArriba }

	method irAbajo() {
		direccion = abajo
		self.moverte(self.cantidadAbajo())
	}
	method cantidadAbajo() = if (0 != position.y()) {1} else {-maxArriba }
	

	method irIzquierda() {
		direccion = izquierda
		self.moverte(self.cantidadIzquierda())
	}
	method cantidadIzquierda() = if ( 0 != position.x()) {1} else {-maxDeracha }

	method irDerecha() {
		direccion = derecha
		self.moverte(self.cantidadDerecha())
	}
	method cantidadDerecha() = if ( maxDeracha != position.x()) {1} else {-maxDeracha}
	
	
	method moverte(cantidad) {
		position = direccion.siguiente(position, cantidad)
	}

}


object inspeccion {
	var property infectadas = 0
	var property infectadasNoAisladas = 0
	var property infectadasConSintomas = 0

}