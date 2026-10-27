import tipoAbono.*
import entrada.*
import errores.*

class Asistente {
    const tipoAbono
    const historialEntradas = []
    method historialEntradas() = historialEntradas
    var property dineroDisponible

    method tieneSaldoPositivo() = dineroDisponible > 0

    // Se uso polimorfismo ya que el resultado depen de del tipo de abono, y asi se puede encapsular el proceso en los tipos y ahorrarse hacer un if-else
    method comprarEntrada(banda, fecha) {
        if(self.tieneSaldoPositivo()) {
            const entrada = new Entrada (banda = banda, fecha = fecha)
            historialEntradas.add(entrada)
            dineroDisponible = tipoAbono.descontarSaldo(dineroDisponible, entrada.precioFinal())
            }
        else {
            throw new NoHaySaldoDisponibleException()
         // Hice que aparezca un error (excepcion) para mostrar que no se debe poder comprar con saldo negativo.
        }
    }

    method entradasDeAnioPasado() {
        const hoy = new Date()
        const anioPasado = hoy.year() - 1
        const lista = historialEntradas.filter{entrada => (entrada.fecha()).year() == anioPasado} //Se usaron muchas funciones lambda a lo largo del trabajo para crear funciones unicas muy especificas para mapear, filtrar y para un max
        return lista
    }

    method bandasConEntradaComprada() {
        const lista = historialEntradas.map{entrada => (entrada.banda()).nombre()}
        return lista.asSet()
    }

    method totalRecaudaciones() {
        const lista = historialEntradas.map{entrada => entrada.precioFinal()}
        return lista.sum()
    }

    method aplicarBono() {
        tipoAbono.subirAbono()
    }
}
