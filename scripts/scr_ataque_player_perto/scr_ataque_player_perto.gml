// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações



function scr_ataque_player_perto(outro, dist, xscale ){
	
	
	var jogador = collision_line(x, y - sprite_height/2, x + (dist * xscale), y - sprite_height/2, outro, 0, 1);

if (jogador)
{
    estado = "ataque";
}
	

}



