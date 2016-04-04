package ar.edu.unq.acahaygatoencerrado.dominio

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Inventario {
	List<Item> items = new  ArrayList<Item>()
	
	
	def agregar(Item item){
		if(this.chequearEspacioDisponible){
			items.add(item)
		}	
	} 
	
	def chequearEspacioDisponible(){
		items.size() < 15
	}

	def quitar(Item item){
		items.remove(item)
	}
	
}