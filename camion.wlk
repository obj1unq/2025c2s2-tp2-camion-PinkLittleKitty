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
}
