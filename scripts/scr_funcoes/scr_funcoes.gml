// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
//function scr_funcoes(){

//}
///@function screenshake(valor_da_tremida)
///@arg força_da_tremida
///@arg [dir_modo]
///@arg [direcao]
function screenshake(_treme, dir_modo, direcao)
{
	var shake = instance_create_layer(0, 0, "instances", obj_screenshake)	
	shake.shake = _treme;
	shake.dir_modo = dir_modo;
	shake.dir = direcao
}