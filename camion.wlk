import cosas.*

object camion {
	const property cosas = #{}
	var property nivelPeligrosidad = 0
	var property capacidad = 0
	var property capacidadMaxima = 2500
		
	method cargar(unaCosa) {
		if (cosas.contains(unaCosa)) {
			self.error("El camion ya tiene esa cosa cargada")
		} else if (unaCosa.peso() + self.capacidad() > self.capacidadMaxima()) {
			self.error("El camion no tiene capacidad para esa cosa")
		} else if (unaCosa.nivelPeligrosidad() + self.nivelPeligrosidad() > 50) {
			self.error("El camion no puede cargar esa cosa por su nivel de peligrosidad")
		} else {
			cosas.add(unaCosa)
		}
	}

	method descargar(unaCosa) {
		if (!cosas.contains(unaCosa)) {
			self.error("El camion no tiene esa cosa cargada")
		} else {
			cosas.remove(unaCosa)
		}
	}

	method todoPesoPar() {
		return cosas.all({cosa => cosa.peso() % 2 == 0})
	}

	method hayAlgoQuePese(cantidad) {
		return cosas.any({cosa => cosa.peso() == cantidad})
	}
}
