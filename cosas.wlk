
object knightRider{
  method consecuenciasDeLaCarga(){}
  method bultosQueOcupa() = 1
  method peso() = 500
  method nivelDePeligrosidad() = 10
}
object bumblebee{
  var estaComoAuto = true

  method consecuenciasDeLaCarga(){ if(estaComoAuto) self.cambiarARobot()}
  method bultosQueOcupa() = 2
  method cambiarARobot() { estaComoAuto = false}
  method peso() = 800
  method nivelDePeligrosidad() = if (estaComoAuto) 15 else 30 
}
object paqueteDeLadrillos{
  var cantLadrillos = 102

  method consecuenciasDeLaCarga(){ cantLadrillos += 12}
  method bultosQueOcupa(){
      if(cantLadrillos <= 100){return 1}
      else if(cantLadrillos.between(101,300)){return 2}
      else{return 3} }
  method modificarCantidadLadrillos(nuevaCant){ cantLadrillos = nuevaCant}
  method peso() = cantLadrillos *2
  method nivelDePeligrosidad() = 2
}
object arenaAGranel{
  var pesoActual = 0

  method consecuenciasDeLaCarga(){ pesoActual -=10}
  method bultosQueOcupa() = 1
  method cambiarPeso(nuevoPeso){pesoActual = nuevoPeso}
  method peso() = pesoActual
  method nivelDePeligrosidad() = 1
}
object bateriaAntiaerea{
  var estaConMisiles = true

  method consecuenciasDeLaCarga(){ if (!estaConMisiles) estaConMisiles = true}
  method bultosQueOcupa() = if(estaConMisiles) 2 else 1
  method quitarMisiles(){ estaConMisiles = false}
  method peso() = if (estaConMisiles) 300 else 200
  method nivelDePeligrosidad() = if (estaConMisiles) 100 else 0
}
object contenedorPortuario{
  const cosasAdentro = []

  method consecuenciasDeLaCarga(){ cosasAdentro.forEach({ c => c.consecuenciasDeLaCarga()})}
  method bultosQueOcupa() = 1 + cosasAdentro.sum({c => c.bultosQueOcupa()})
  method sumarCosas(otraCosa){cosasAdentro.add(otraCosa)}
  method peso() = cosasAdentro.sum({c => c.peso()}) + 100
  method nivelDePeligrosidad() = if (cosasAdentro.isEmpty()) 0 else cosasAdentro.find({c => c.nivelDePeligrosidad().max()})
}
object residuosRadioactivos{
  var pesoActual = 0
  method consecuenciasDeLaCarga(){ pesoActual +=15}
  method bultosQueOcupa() = 1
  method modificarPeso(nuevoPeso){pesoActual = nuevoPeso}
  method peso() = pesoActual
  method nivelDePeligrosidad() = 200
}
object embalajeDeSeguridad{
  var cosaAdentro = knightRider

  method consecuenciasDeLaCarga(){}
  method bultosQueOcupa() = 2
  method cambiarCosaAdentro(nuevaCosa){cosaAdentro = nuevaCosa}
  method peso() = cosaAdentro.peso()
  method nivelDePeligrosidad() = cosaAdentro.peso() / 2
}
