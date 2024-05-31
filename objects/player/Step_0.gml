/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
//codigo de movimentação 
//codigo de gravidade
// pulando

if(instance_exists(Obj_transicao)) exit;

//controle da invencibilidade
/*if (invencivel && tempo_invecivel > 0)
{
	tempo_invecivel--;
	//velocidade que ele vai piscar
	image_alpha = max(sin(get_timer()/100000), 0.2);
}
else
{
	invencivel = false;
	image_alpha = 1;
}
*/
var _right, _left, _jump, _attack, _dash;
var _chao = place_meeting(x, y + 1, obj_block);

_right = keyboard_check(ord("D"));
_left = keyboard_check(ord("A"));
_jump = keyboard_check_pressed(ord("W"));
_attack = keyboard_check_pressed(ord("K"));
_dash = keyboard_check_pressed(ord("L"));


if (ataque_buff > 0) ataque_buff -= 1;

if (dash_timer > 0) dash_timer--;

velh = (_right - _left) * max_velh * global.vel_mult;

switch(estado)
{
	#region parado
	case "parado":
	{
		//dash aereo
		//if (_chao) dash_aereo = true;
		
		
		mid_velh = 0;
		
		sprite_index = player_parado1;
		
		if(velh != 0)
		{
			estado = "movendo";
		}
		else if (_jump || !_chao)
		{
			estado = "pulando";
			velv = (-max_velv * _jump);
			image_index = 0;
		}
		else if(_attack)
		{
			iniciar_ataque(_chao)
		}
		else if (_dash && dash_timer <= 0)
		{
			estado = "dash";
			image_index = 0;
		}
		break;
		
	}
	#endregion
	
	#region movendo
	case "movendo":
	{
		sprite_index = player_run;
				
				
		if (abs(velh) < .1)
		{
			estado = "parado";
			velh = 0;
		}
		
		else if (_jump || !_chao)
		{
			
			estado = "pulando";
			velv = (-max_velv * _jump);
			image_index = 0;
		}
		else if (_attack)
		{
			iniciar_ataque(_chao)
		}
		else if (_dash && dash_timer <= 0)
		{
			estado = "dash";
			image_index = 0;
		}
		
		
		break;
	}
	#endregion
	
	#region pulando
	case "pulando":
	{
		
		if(velv > 0)
		{
			sprite_index = player_caindo;
		}
		else
		{
			sprite_index = player_pulo;
			if (image_index >= image_number-1)
			{
				image_index = image_number-1;
			}
		}
		
		if (_attack)
		{
			iniciar_ataque(_chao);
		}
		
		if(_chao)
		{
				estado = "parado";
				//velh = 0; ficar parado quando pular
		}
		
		
		
		
		//fazendo ele deslizar pela parede
		var deslize = place_meeting(x + sign(velh), y, obj_block);
		
		if (deslize)
		{
			
			if (_jump)
			{
				velv = -max_velv;
				mid_velh = (max_velh * 2) * sign(velh) * -1;
			}
			sprite_index = player_deslizando;
			//caso queira ver algo muito maneiro tire o 'velv'
			
			if (velv > 1)
			{
				velv = 1;	
			}
			else
			{
				aplica_gravidade();	
			}
		}
		else
		{
			aplica_gravidade();	
			
			 mid_velh = lerp(mid_velh, 0, 0.05);
		}
		
		//dash aereo
		/*if (_dash && dash_aereo == true)
		{
			estado = "dash aereo";	
		}*/
		
		break;	
	}
	#endregion
	
	#region dash aereo
	/*
	case "dash aereo":
	{
		dash_aereo = false;
		
		if (sprite_index != player_dash_aereo)
		{
			sprite_index = player_dash_aereo;
			
			dash_aereo_timer = room_speed / 4;
		}
		
		dash_aereo_timer--;
		
		if(dash_aereo_timer <= 0)
		{
			estado = "parado";	
		}
		velh = 0;
		mid_velh = dash_vel * image_xscale;
		
		velv = 0;
		
		break;
	}*/
		
	#endregion
	
	#region ataque aereo para baixo
	
	case "ataque aereo baixo":
	{
		aplica_gravidade();
		velv += .3;
		if (!ataque_baixo)
		{
			sprite_index = player_ataque_ar02;
			image_index = 0;
			ataque_baixo = true;
		}
		
		if (sprite_index == player_ataque_ar02)
		{
			// velocidade que ele vai para a proxima sprite
			if (image_index > 1)
			{
				sprite_index = player_ataque_ar03;
				image_index = 0;
			}
		}
		
		if (_chao)
		{
			if (sprite_index != player_ataque_ar04)
			{
				sprite_index = player_ataque_ar04;
				image_index = 0;
				
				screenshake(8, true, 270)
				
			}
			else
			{	// velocidade da animação final do ataque para baixo
				if (image_index >= image_number - 1)
				{
					estado = "parado";
					ataque_baixo = false;
					finaliza_ataque();
				}
			}
		}
		
		if (sprite_index == player_ataque_ar02 && dano == noone && posso)
		{
			dano = instance_create_layer(x + sprite_width/2 + velh * 2, y - sprite_height/2, layer, obj_dano);	
			dano.dano = ataque;
			dano.pai = id;
			dano.morrer = false;
			posso = false;
		}
		
		
		break;	
	}
	
	#endregion
	
	#region ataque aereo
	case "ataque aereo":
	{
		aplica_gravidade();
		if (sprite_index != player_ataque1)
		{
			sprite_index = player_ataque1;
			image_index = 0;
		}
		
		if (image_index >= 1 && dano == noone && posso)
		{
			dano = instance_create_layer(x + sprite_width/2 + velh * 2, y - sprite_height/2, layer, obj_dano);	
			dano.dano = ataque;
			dano.pai = id;
			posso = false;
		}
		
		if (image_index >= image_number - 1)
		{
			estado = "pulando";
			finaliza_ataque();
		}
		if (_chao)
		{
			estado = "parado";
			posso = true;
			if (dano)
			{
				instance_destroy(dano, false);
				dano = noone;
			}
		}
		
		break;
	}
	#endregion
	
	#region ataque
	case "ataque":
	{
		
		velh = 0;
		if (combo == 0)
		{
			sprite_index = player_ataque1;
		}
		else if (combo == 1)
		{
			sprite_index = player_ataque2;	
			
		}
		else if (combo == 2)
		{
			sprite_index = player_ataque3;	
		}
		
		if (image_index >= 2 && dano == noone && posso)
		{
			
			//var dano_x_offset = -sprite_width / 10 - 10; // primeiro valor para a esquerda e o segundo valor para a direita
			//var dano_y_offset = -sprite_height / 2;
			dano = instance_create_layer(x + sprite_width/2, y - sprite_height/2, layer, obj_dano);
			//dano = instance_create_layer(x - dano_x_offset, y + dano_y_offset, layer, obj_dano);
			//dano.image_xscale = 2;
			dano.dano = ataque * ataque_mult;
			dano.pai = id;
			posso = false;
		}
		
		
		if (_attack && combo < 2 )
		{
			ataque_buff = room_speed;	
		}
		 
		
		if (ataque_buff && combo < 2 && image_index >= image_number-1)
		{
			combo++;
			image_index = 0;
			posso = true;
			ataque_mult += .5 ;
			if (dano)
			{
				instance_destroy(dano, false);
				dano = noone;
			}
			
			
			ataque_buff = 0;
			
		}
		
		if (image_index > image_number-1)
		{
			estado = "parado";	
			velh = 0;
			combo = 0;
			posso = true;
			ataque_mult = 1;
			finaliza_ataque()
		}
		
		if (_dash && dash_timer <= 0)
		{
			estado = "dash";
			image_index = 0;
			combo = 0;
			if (dano)
			{
				instance_destroy(dano, false);
				dano = noone;
			}
		}
		
		if (velv != 0)
		{
			estado = "pulando";
			image_index = 0;
		}
		
		break;
	}
	#endregion
	
	#region dash
	case "dash":
	{
		if (sprite_index != player_dash)
		{
			sprite_index = player_dash;	
			image_index = 0;
		}
		
		mid_velh = image_xscale * dash_vel;
		velh = 0;
		
		if (image_index >= image_number -1 || !_chao)
		{
			estado = "parado"
			mid_velh = 0;
			dash_timer = dash_delay;
		}
		
		break;
	}
	#endregion
	
	#region dano recebido
	case "dano recebido":
	{
		if (sprite_index != player_dano_recebido)	
		{
			sprite_index = player_dano_recebido;
			image_index = 0;
			//tremendo a tela apos levar hit
			screenshake(3);
			
			
			//caso queira deixar o player invencivel por poucos segundos apos 1 hit
			//invencivel = true;
			//tempo_invecivel = invencivel_timer;
		}
		
		//deixa o player parado quando leva dano
		velh = 0;
	//	velv = 0;
		
		if (vida_atual > 0)
		{
			if (image_index >= image_number -1)
			{
				estado = "parado"
			}	
		}
		else
		{
			if (image_index >= image_number - 1)
			{
				estado = "morrendo"	
			}
		}
		
		break;
	}
	#endregion
	
	#region morrendo
	case "morrendo":
	{
		
		if (instance_exists(game_controller))
		{
			with(game_controller)
			{
				game_over = true;	
			}
			
		}
		
		velh = 0;
		
		if (sprite_index != player_morrendo)
		{
			image_index = 1;
			sprite_index = player_morrendo;
		}
		
		if (image_index >= image_number - 1)
		{
			image_index = image_number - 1;	
		}
		
		break;
	}
	#endregion
	
	
	default: 
	{
		estado = "parado";
	}
}

if (keyboard_check(vk_enter)) game_restart();

