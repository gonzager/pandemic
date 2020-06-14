
class Direccion {
	method siguiente(position, cantidad)
}

object izquierda inherits Direccion { 
	override method siguiente(position,cantidad) = position.left(cantidad) 
}

object derecha inherits Direccion { 
	override method siguiente(position, cantidad) = position.right(cantidad) 
}

object abajo inherits Direccion { 
	override method siguiente(position, cantidad) = position.down(cantidad) 
}

object arriba inherits Direccion { 
	override method siguiente(position, cantidad) = position.up(cantidad) 
}
