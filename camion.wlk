import cosas.*

object camion {
	const property cosas = #{}
	var nivelPeligrosidad = 0
	var capacidad = 0
	const capacidadMaxima = 2500
	const tara = 1000
		
	method cargar(unaCosa) {
		if (cosas.contains(unaCosa)) {
			self.error("El camion ya tiene esa cosa cargada")
		} else {
			cosas.add(unaCosa)
			capacidad = capacidad + unaCosa.peso()
			nivelPeligrosidad = nivelPeligrosidad + unaCosa.nivelPeligrosidad()
		}
	}

	method descargar(unaCosa) {
		if (!cosas.contains(unaCosa)) {
			self.error("El camion no tiene esa cosa cargada")
		} else {
			cosas.remove(unaCosa)
			capacidad = capacidad - unaCosa.peso()
			nivelPeligrosidad = nivelPeligrosidad - unaCosa.nivelPeligrosidad()
		}
	}

	method nivelPeligrosidad() {
		return nivelPeligrosidad
	}

	method todoPesoPar() {
		return cosas.all({cosa => cosa.peso() % 2 == 0})
	}

	method hayAlgoQuePese(cantidad) {
		return cosas.any({cosa => cosa.peso() == cantidad})
	}

	method pesoTotal() {
		return tara + cosas.sum({cosa => cosa.peso()})
	}

	method pesoExcedido() {
		return self.pesoTotal() > capacidadMaxima
	}

	method cualTieneNivelPeligrosidad(cantidad) {
		return cosas.filter({cosa => cosa.nivelPeligrosidad() == cantidad})
	}

	method cosasConMayorNivelPeligrosidad(cantidad) {
		return cosas.filter({cosa => cosa.nivelPeligrosidad() > cantidad})
	}

	method cosasConMayorNivelPeligrosidadQue(cosaDada) {
		return self.cosasConMayorNivelPeligrosidad(cosaDada.nivelPeligrosidad())
	}

	method puedeCircular(peligrosidad) {
		return nivelPeligrosidad < peligrosidad && !self.pesoExcedido()
	}

	method tieneAlgoQuePeseEntre(min, max) {
		return cosas.any({cosa => cosa.peso() >= min && cosa.peso() <= max})
	}

	method cosaMásPesada() {
		if (cosas.isEmpty()) {
			self.error("El camión no tiene cosas cargadas")
		} else {
			return cosas.max({cosa => cosa.peso()})
		}
	}

	method pesos() {
		return cosas.map({cosa => cosa.peso()})
	}

	method cantidadBultos() {
		return cosas.sum({cosa => cosa.cantidadBultos()})
	}

	method accidente() {
		cosas.forEach({cosa => cosa.accidente()})
		nivelPeligrosidad = cosas.sum({cosa => cosa.nivelPeligrosidad()})
		capacidad = cosas.sum({cosa => cosa.peso()})
	}

	method transportar(destino, camino) {
		if (camino.puedeCircular(self)) {
			destino.cargarTodo(cosas)
			cosas.clear()
			nivelPeligrosidad = 0
			capacidad = 0
		} else {
			self.error("El camino no puede ser recorrido")
		}
	}
}

object ruta9 {
	method puedeCircular(camion) {
		return camion.puedeCircular(20)
	}
}

object caminosVecinales {
	var pesoMaximoPermitido = 3000

	method pesoMaximoPermitido(peso) {
		pesoMaximoPermitido = peso
	}

	method puedeCircular(camion) {
		return camion.pesoTotal() <= pesoMaximoPermitido
	}
}

object almacen {
	var property cosas = #{}
	
	method cargarTodo(nuevasCosas) {
		cosas.addAll(nuevasCosas)
	}

	method cargar(unaCosa) {
		if (cosas.contains(unaCosa)) {
			self.error("El almacén ya tiene esa cosa cargada")
		} else {
			cosas.add(unaCosa)
		}
	}

	method descargar(unaCosa) {
		if (!cosas.contains(unaCosa)) {
			self.error("El almacén no tiene esa cosa cargada")
		} else {
			cosas.remove(unaCosa)
		}
	}
}