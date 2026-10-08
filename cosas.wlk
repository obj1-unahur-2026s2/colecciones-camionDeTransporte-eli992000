
object knightRider{
  method peso() = 500
  method nivelDePeligrosidad() = 10
}
object bumblebee{
  var estaComoAuto = true

  method cambiarARobot() { estaComoAuto = false}
  method peso() = 800
  method nivelDePeligrosidad() = if (estaComoAuto) 15 else 30 
}
object paqueteDeLadrillos{
  var cantLadrillos = 0

  method modificarCantidadLadrillos(nuevaCant){ cantLadrillos = nuevaCant}
  method peso() = cantLadrillos *2
  method nivelDePeligrosidad() = 2
}
object arenaAGranel{
  var pesoActual = 0

  method cambiarPeso(nuevoPeso){pesoActual = nuevoPeso}
  method peso() = pesoActual
  method nivelDePeligrosidad() = 1
}
object bateriaAntiaerea{
  var estaConMisiles = true

  method quitarMisiles(){ estaConMisiles = false}
  method peso() = if (estaConMisiles) 300 else 200
  method nivelDePeligrosidad() = if (estaConMisiles) 100 else 0
}
object contenedorPortuario{
  const cosasAdentro = []

  method sumarCosas(otraCosa){cosasAdentro.add(otraCosa)}
  method peso() = cosasAdentro.sum({c => c.peso()}) + 100
  method nivelDePeligrosidad() = if (cosasAdentro.isEmpty()) 0 else cosasAdentro.find({c => c.nivelDePeligrosidad().max()})
}
object residuosRadioactivos{
  var pesoActual = 0

  method modificarPeso(nuevoPeso){pesoActual = nuevoPeso}
  method peso() = pesoActual
  method nivelDePeligrosidad() = 200
}
object embalajeDeSeguridad{
  var cosaAdentro = knightRider

  method cambiarCosaAdentro(nuevaCosa){cosaAdentro = nuevaCosa}
  method peso() = cosaAdentro.peso()
  method nivelDePeligrosidad() = cosaAdentro.peso() / 2
}
