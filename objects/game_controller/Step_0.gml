/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
//velocidade da tela 
if (game_over) 
{
	global.vel_mult = .5;
	//show_debug_message("Tecla para cima pressionada: global.vel_mult = " + string(global.vel_mult));
}
else
{
	global.vel_mult	= 1;
	//show_debug_message("Tecla para cima não pressionada: global.vel_mult = " + string(global.vel_mult));
}
//show_debug_message("global.vel_mult: " + string(global.vel_mult));

/*if (keyboard_check(vk_up))
{
	game_over = true;	
}
else
{
	game_over = false;	
}