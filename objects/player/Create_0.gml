/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event


randomize();

var cam = instance_create_layer(x, y, layer, Obj_camera);
cam.alvo = id;



event_inherited();


max_vida = 2;
vida_atual = max_vida;

max_velh = 5;
max_velv = 7;
dash_vel = 4;

mostra_estado = true;

combo = 0;
dano = noone;
ataque = 1;
posso = true;
ataque_mult = 1;
ataque_buff = room_speed;
ataque_baixo = false;

invencivel = false;
invencivel_timer = room_speed * 3;
tempo_invecivel = invencivel_timer;

dash_delay = room_speed * 2;
dash_timer = 0;
dash_aereo_timer = 0;
dash_aereo = true;


global.power_ups = [false, false];



///@method inicia_ataque(_chao)
///@arg {bool} _chao
iniciar_ataque = function(_chao)
{
	if (_chao)
	{
		estado = "ataque";
		velh = 0;
		image_index = 0;
	}
	else
	{
		if (keyboard_check(ord("S")))
		{
			estado = "ataque aereo baixo";
			velh = 0;
			image_index = 0;
		}
		else
		{
		estado = "ataque aereo";
		velh = 0;
		image_index = 0;
		}
	}
}

finaliza_ataque = function()
{
	posso = true;
		if (dano)
			{
				instance_destroy(dano, false);
				dano = noone;
			}
}

aplica_gravidade = function()
{
	var _chao = place_meeting(x, y + 1, obj_block);
	if (!_chao)
	{
		if(velv < max_velv * 2)
		{
			velv += GRAVIDADE * massa * global.vel_mult;
		}
	}
}	
