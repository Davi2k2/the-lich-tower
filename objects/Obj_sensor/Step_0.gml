/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var jogador = place_meeting(x, y, player);
var interacao = keyboard_check_released(ord("E"));

if(jogador && interacao){
	
	var tran = instance_create_layer(0, 0, layer, Obj_transicao);
	tran.destino = destino;
	tran.destino_x = destino_x;
	tran.destino_y = destino_y;
}