object knightRider {
	method cantidadBultos() { return 1 }
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object arenaGranel {
	var property peso = 0

	method peso() { return peso }
	method nivelPeligrosidad() { return 1 }
	method cantidadBultos() { return 1 }
}

object bumblebee {
	var property transformado = false

	method peso() { return 800}
	
	method nivelPeligrosidad() { 
		if (self.transformado()) {
			return 30
		} else {
			return 15
		}
	}

	method cantidadBultos() { return 2 }
}

object ladrillos {
	var property cantidad = 0

	method peso() { return cantidad * 2 }
	method nivelPeligrosidad() { return 2 }
	method cantidadBultos() {
		if (cantidad <= 100) {
			return 1
		} else if (cantidad <= 300) {
			return 2
		} else {
			return 3
		}
	}
}

object bateríaAntiaérea {
	var property tieneMisiles = false

	method peso() {
		if (self.tieneMisiles()) {
			return 300
		} else {
			return 200
		}
	}

	method nivelPeligrosidad() {
		if (self.tieneMisiles()) {
			return 100
		} else {
			return 0
		}
	}

	method cantidadBultos() {
		if (self.tieneMisiles()) {
			return 2
		} else {
			return 1
		}
	}
}

object residuosRadioactivos {
	var property peso = 0
	
	method peso() { return peso }
	method nivelPeligrosidad() { return 200 }
	method cantidadBultos() { return 1 }
}

object contenedorPortuario {
	const peso = 100
	const contenido = #{}

	method peso() { return peso + contenido.sum({cosa => cosa.peso()}) }
	method nivelPeligrosidad() { return self.contenidoMasPeligroso()}

	method cargar(unaCosa) {
		if (contenido.contains(unaCosa)) {
			self.error("El contenedor ya tiene esa cosa cargada")
		} else {
			contenido.add(unaCosa)
		}
	}

	method descargar(unaCosa) {
		if (!contenido.contains(unaCosa)) {
			self.error("El contenedor no tiene esa cosa cargada")
		} else {
			contenido.remove(unaCosa)
		}
	}

	method contenidoMasPeligroso() {
		if (contenido.isEmpty()) {
			return 0
		} else {
			return contenido.max({cosa => cosa.nivelPeligrosidad()}).nivelPeligrosidad()
		}
	}
	method cantidadBultos() { return 1 + contenido.sum(({cosa => cosa.cantidadBultos()})) }
}

object embalajeSeguridad {
	var envuelve = null

	method envolver(unaCosa) {
		envuelve = unaCosa
	}

	method desenvolver() {
		envuelve = null
	}

	method peso() { return envuelve.peso() }
	method nivelPeligrosidad() { return envuelve.nivelPeligrosidad() / 2 }
	method cantidadBultos() { return 2 }
}