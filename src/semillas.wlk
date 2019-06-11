class Planta {
	var property anioDeObtencion 
	var property altura
	
	method horasAlSolToleradas() = 10
	method esFuerte() = self.horasAlSolToleradas() > 10
	method daNuevasSemillas() = self.esFuerte() or self.condicionSecundaria()
	method condicionSecundaria() 
	method espacioOcupado() = 1
}

class Menta inherits Planta {
	override method horasAlSolToleradas() = 6
	override method condicionSecundaria() = self.altura() > 0.4
	override method espacioOcupado() = self.altura() * 3
}

class Soja inherits Planta {
	override method horasAlSolToleradas() = 
		if (self.altura() < 0.5) { 6 }
		else if(self.altura().between(0.5, 1)) { 7 }
		else { 9 }
	
	override method condicionSecundaria() = 
		self.semillaReciente() and
		self.alturaSuficiente()
		
	method semillaReciente() = self.anioDeObtencion() > 2007
	method alturaSuficiente() = self.altura() > 1
	
	override method espacioOcupado() = self.altura() / 2
}

class Quinoa inherits Planta {
	var property horasToleradasDeSol 

	override method horasAlSolToleradas() = horasToleradasDeSol
	override method condicionSecundaria() = self.anioDeObtencion() < 2005
	override method espacioOcupado() = 0.5
}

class SojaTransgenica inherits Soja {
	override method daNuevasSemillas() = false
}

class HierbaBuena inherits Menta {
	override method espacioOcupado() = self.altura() * 6
}