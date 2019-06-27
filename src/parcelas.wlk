class Parcela {
	var property ancho 
	var property largo
	var property horasDeSolAlDia
	
	const plantas = []
	
	method seAsociaBien(planta)
	
	method listaDePlantas() = plantas
	method superficie() = self.ancho() * self.largo()
	method cantidadDePlantas() = plantas.size()
	
	method cantidadMaximaDePlantas() = 
		if(self.ancho() > self.largo()) { self.masAncha() }
		else { self.masLarga() }
		
	method masAncha() = self.superficie() / 5
	method masLarga() = (self.superficie() / 3) + self.largo()
	
	method tieneComplicaciones() =
		self.listaDePlantas().any({ planta => planta.horasAlSolToleradas() < self.horasDeSolAlDia() })
	
	method plantarSiPuede(planta) {
		self.hayLugar()
		self.climaAdecuado(planta)
		self.plantar(planta)
	}
	
	method plantar(planta) { plantas.add(planta) }
	
	method hayLugar() {
		if(self.estaAlLimite()) { throw new Exception("No hay lugar en la parcela.") }
	}
	
	method estaAlLimite() = self.listaDePlantas().size() == self.cantidadMaximaDePlantas()
	
	method climaAdecuado(planta) {
		if(self.hayDemaciadoSol(planta)) { throw new Exception("Recibe demaciadas horas de sol al dia.") }
	}

	method hayDemaciadoSol(planta) = (self.horasDeSolAlDia() - planta.horasAlSolToleradas()) > 2 
	
	method plantasQueSeAsocianBien() = 
		self.listaDePlantas().filter({ planta => planta.seAsociaBienA(self) })
		
	method porcentajeDePlantasQueSeAsocianBien() =
		self.plantasQueSeAsocianBien().size() / self.listaDePlantas().size()
}

class ParcelaEcologica inherits Parcela {
	override method seAsociaBien(planta) = 
		not self.tieneComplicaciones() and  //Decidí revisar si tiene complicaciones sin plantarla porque me pareció que a la hora
		planta.parcelaEsIdeal(self)			//de plantar lo importante sería el estado previo de la parcela y si esta se complica
}											//tras la plantacion realmente no es importante...

class ParcelaIndustrial inherits Parcela {
	override method seAsociaBien(planta) = 
		self.maximoDeDos() and
		planta.esFuerte()
		
	method maximoDeDos() = self.listaDePlantas().size() >= 2
}