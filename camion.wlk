import cosas.*
 object camion{
  const cargaActual = []
  const tara = 1000
  const pesoMaximoPermitido = 2500

  method cargarCamionCon(unaCosa){cargaActual.add(unaCosa)}
  method descargarDelCamion(unaCosa){ cargaActual.remove(unaCosa)}
  method pesoTotal() = cargaActual.sum({c => c.peso()}) + tara
  method hayUnaCosaQuePese(unValor) = cargaActual.any({c => c.peso() == unValor})
  method losPesosSonPares(){cargaActual.all({c => c.peso()%2==0})}
  method cosaConNivelDePeligrosidad(unNivel) = cargaActual.find({c => c.nivelDePeligrosidad() == unNivel})
  method cosasConMasNivelQue(unValor){cargaActual.filter({c => c.nivelDePeligrosidad() > unValor }) } //devuelve true, deberia devolver el objeto.
  method cosasQueSuperanElNivelDe(otraCosa){cargaActual.filter({c => c.nivelDePeligrosidad() > otraCosa.nivelDePeligrosidad()})} // devuelve true, deberia edvolver el objeto.
  method estaExedido() = self.pesoTotal() > pesoMaximoPermitido
  method puedeCircularEnRuta(nivelMax) = !self.estaExedido() && cargaActual.find({c => c.nivelDePeligrosidad() < nivelMax})// devuelve bumblebee, con bumblebee dentro de la lista, deberia devolver true o false
  method tieneAlgoQuePeseEntre(unValor, otroValor) = cargaActual.filter({c => c.peso().between(unValor,otroValor)})
  method laCosaMasPesada() = cargaActual.max({c => c.peso()}) //funciona.
 }
