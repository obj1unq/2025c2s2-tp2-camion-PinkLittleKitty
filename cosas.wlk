object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object arenaGranel {
	var property peso = 0

	method peso() { return peso }
	method nivelPeligrosidad() { return 1 }
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
}

object ladrillos {
	var property cantidad = 0

	method peso() { return cantidad * 2 }
	method nivelPeligrosidad() { return 2 }
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
}

object residuosRadioactivos {
	var property peso = 0
	
	method peso() { return peso }
	method nivelPeligrosidad() { return 200 }
}