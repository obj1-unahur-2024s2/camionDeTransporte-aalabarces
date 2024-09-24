import cosas.*
object camion {
	var carga = []
	
	method cargar(cosa){
		carga.add(cosa)
		cosa.cambiar()
	}
	method descargar(cosa){
		carga.remove(cosa)
	}
	method peso()=carga.sum({ c=> c.peso() })+1000
	method todasLasCargasPesanImpar() = carga.all({c=> c.peso().odd() })
	method algoPesa_(unPeso)=carga.any({c=> c.peso()==unPeso})
	method objetoDePeligrosidad_(unaPeligrosidad)=carga.find({c=> c.peligrosidad()==unaPeligrosidad})
	method cosasMasPeligrosasDe_(unaPeligrosidad)=carga.filter({c=>c.peligrosidad()>unaPeligrosidad})
	method cosasMasPeligrosasQue_(unObjeto)=self.cosasMasPeligrosasDe_(unObjeto.peligrosidad())
	method estaExcedidoDePeso()=self.peso()>2500
	method puedeCircularEnRuta(maxPeligrosidad)=not self.estaExcedidoDePeso() and carga.all({c=>c.peligrosidad()<=maxPeligrosidad})
	method algoPesaEntre_Y_(pesoMin, pesoMax)=carga.any({c=>c.peso().between(pesoMin,pesoMax)})
	method cargaMasPesada()=carga.max({c=>c.peso()})
}
