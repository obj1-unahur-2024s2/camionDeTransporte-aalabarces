object knightRider {
	method peso() = 500
	method peligrosidad() = 10
	method bultos()=1
	method cambiar(){}
}

object bumblebee {
	var estado = auto
	method peso() = 800
	method peligrosidad()= estado.peligrosidad()
	method transformarse(unEstado){
		estado = unEstado
	}
	method bultos()=2
	method cambiar(){
		self.transformarse()
	}
}

object auto {
	method peligrosidad()=15
}

object robot {
	method peligrosidad()=30
}

object paqueteLadrillos {
	var property cantidad = 1
	method peso()=cantidad*2
	method peligrosidad()=2
	method bultos(){
		if (cantidad<=100) return 1
		else if cantidad.between(101,300) return 2
		else return 3
	}
	method cambiar(){
		cantidad += 12
	}
}

object arena {
	var property peso = 1
	method peligrosidad()=1
	method bultos()=1
	method cambiar(){
		peso = 0.max(peso-10)
	}
}

object bateriaAntiaerea {
	var tieneMisiles = false
	method cargarMisiles(){
		tieneMisiles = true
	}
	method descargarMisiles(){
		tieneMisiles = false
	}
	method peso()= if (tieneMisiles) 300 else 200
	method peligrosidad()=if (tieneMisiles) 100 else 0
	method bultos()=if (tieneMisiles) 2 else 1
	method cambiar(){cargarMisiles()}
}

object contenedor {
	const contenido = []
	method peso() = contenido.sum({ obj => obj.peso() }) + 100
	method peligrosidad(){
		if (contenido.isEmpty()) return 0
		return contenido.max({ obj => obj.peligrosidad() }).peligrosidad()
	}
	method agregarAlContenido(objeto){
		contenido.add(objeto)
	}
	method sacarDelContenido(objeto){
		contenido.remove(objeto)
	}
	method bultos()=1+contenido.size()
	method cambiar(){
		carga.forEach({c=>c.cambiar()})
	}
}

object residuosRadioactivos {
	var property peso = 0
	method peigrosidad()=200
	method bultos()=1
	method cambiar(){
		peso += 15
	}
}

object embalajeSeguridad {
	var property objetoDentro = cosaNulleable
	method peso()=objetoDentro.peso()
	method peligrosidad()=objetoDentro.peligrosidad()*0.5
	method bultos()=2
	method cambiar(){}
}
	
object cosaNulleable {
	method peso()=0
	method peligrosidad()=0
}
