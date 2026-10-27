import asistente.*
import bandas.*

// Se lo hizo un objeto porque es unico y no una instancia de una clase.
object productora {
    const property asistentes = []
    const property bandas = []
    var property impuestoActual = 0

    method gananciaTotal() = (self.listaDeGanancias()).sum() - (self.listaPresupuestos()).sum()

    method listaDeGanancias() = asistentes.map{asistente => asistente.totalRecaudaciones()}

    method listaPresupuestos() = bandas.map{banda => banda.presupuesto()}
    

    method cantidadTotalEntradasVendidas() = (self.listaCantidadEntradasVendidas()).sum()
    
    method listaHistorialesEntradasVendidas() = asistentes.map{asistente => (asistente.historialEntradas())}

    method listaCantidadEntradasVendidas() = (self.listaHistorialesEntradasVendidas()).map{historial => historial.size()}


    method listaEntradasVendidasPor(banda) = (self.listaHistorialesEntradasVendidas()).map{historial => historial.filter{entrada => entrada.banda() == banda}}

    method entradasTotalesVendidasPor(banda) = ((self.listaEntradasVendidasPor(banda)).map{historial => historial.size()}).sum()

    method bandaMasPopular() = bandas.max{banda => self.entradasTotalesVendidasPor(banda)}

    method bonificarAsistenteVip(asistente) {
        asistente.aplicarBono()
    }
}