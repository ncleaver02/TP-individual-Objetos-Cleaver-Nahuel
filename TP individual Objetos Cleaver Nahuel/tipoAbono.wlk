import errores.*

// Aca se uso composicion entre asistente y estos tipos de tipoAbono, ya que dependiendo de que tipo se tenga se podra aplicar descuento o no, y existira la variable descuento en si o tampoco.
object fan {

    method subirAbono() {
        throw new NoEsAsistenteVipException()
    }

    method descontarSaldo(dinero, costo) {
        return dinero - costo
    }
}

// Decidi hacerlo una clase ya que el descuento varia de asistente en asistente y no me pareceria correcto que el descuento sea responsabilidad de este ultimo.
class Vip {
    var property descuento

    method subirAbono() {
        descuento += 0.01
    }

    method descontarSaldo(dinero, costo) {
        return dinero - costo * (1 - descuento)
    }
}