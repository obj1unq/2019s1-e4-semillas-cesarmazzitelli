object _INTA {
	const parcelas = []
	
	method listaDeParcelas() = parcelas
	method agregarParcela(parcela) = parcelas.add(parcela)
	method promedioDePlantasPorParcela() = self.promedioDePlantas()
	
	method promedioDePlantas() = 
	//Como precondicion es necesario que INTA tenga al menos una parcela en su lista de parcelas.
		self.cantidadDePlantas() / self.listaDeParcelas().size()
		
	method cantidadDePlantas() = 
		self.listaDeParcelas().sum({ parcela => parcela.cantidadDePlantas() })

	method parcelaMasAutoSustentable() = 
		self.listaDeParcelas().max({ parcela => parcela.porcentajeDePlantasQueSeAsocianBien() })
	
	method parcelasMasGrandes() =
		self.listaDeParcelas().filter({ parcela => parcela.cantidadDePlantas() > 4 })
}
