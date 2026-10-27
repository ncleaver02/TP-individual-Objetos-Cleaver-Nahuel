// Hice la superClase banda porque todas ellas comparten el atributo nombre y los metodos canon (la trap le agrega algo) y como calculan el presupuesto (aunque difieran en el extra)
class Banda {
    const nombre
    method nombre() = nombre
    // Lo tuve que hacer method (canon) porque BandaTrap lo calcula agregando algo mas (se uso super() para no repetir logica)
    method canon() = 1000000
    
    method presupuesto() = self.canon() + self.gastoExtra()

    method gastoExtra()
    method popularidad()
    // Estos 2 metodos se dejaron de forma abstracta para expresar que sus subclases van a entender sus mensajes aunque sean de forma distinta
}


class BandaRock inherits Banda {
    const cantSolosGuitarra

    override method gastoExtra() = 10000

    override method popularidad() = 100 * cantSolosGuitarra
}

class BandaTrap inherits Banda {
    const tieneHielo

    override method gastoExtra() = 0

    override method popularidad() {
        if(tieneHielo) {
            return 1000
        }
        else return 0
    }

    override method canon() = super() * self.popularidad()
}

class BandaIndie inherits Banda {
    const cantInstrumentos
    
    override method gastoExtra() = 500 * cantInstrumentos

    override method popularidad() = 3.14 * nombre.length()
}