import productora.*

class Entrada {
    const banda
    method banda() = banda
    const fecha
    method fecha() = fecha
    const precioBase = 1000
    
    method impuesto() = productora.impuestoActual()

    method precioFinal() = precioBase + self.impuesto()
}

