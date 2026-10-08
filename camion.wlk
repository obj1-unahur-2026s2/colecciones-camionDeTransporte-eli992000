import cosas.*
 object camion{
  var cargaActual = []
  const tara = 1000
  const pesoMaximoPermitido = 2500

  method cargarCamionCon(unaCosa){cargaActual.add(unaCosa)}
  method pesoTotal() = cargaActual.sum({c => c.peso()}) + tara
  method hayUnaCosaQuePese(unValor) = cargaActual.any({c => c.peso() == unValor})
  method cosasQueSuperan(unValor) = cargaActual.map(c => c.peso() > unValor)
  method estaExedido() = self.pesoTotal() > pesoMaximoPermitido
  method puedeCircularEnRuta(nivelMax) = !self.estaExedido() && cargaActual.find({c => c.nivelDePeligrosidad().max() < nivelMax})
  method tieneAlgoQuePeseEntre(unValor, otroValor) = cargaActual.filter({c => c.peso().between(unValor,otroValor)})
  method laCosaMasPesada() = cargaActual.filter({c => c.peso().max()})
 }
