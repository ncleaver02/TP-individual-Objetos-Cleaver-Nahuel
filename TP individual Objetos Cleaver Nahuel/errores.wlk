class NoHaySaldoDisponibleException inherits Exception {
    override method message() = "Hay saldo negativo. No se puede realizar la compra"
}

class NoEsAsistenteVipException inherits Exception {
    override method message() = "No es posible subirle el bono a un asistente no vip"
}
