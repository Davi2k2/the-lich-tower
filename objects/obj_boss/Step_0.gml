/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _chao = place_meeting(x, y + 1, obj_block);

if (!_chao) 
{
	velv += GRAVIDADE * massa * global.vel_mult;
}


switch(estado)
{
	#region parado
	case "parado":
	{
		
		if (sprite_index != boss_parado)
		{
			sprite_index = boss_parado;
			image_index = 0;
		}
		
		//identificando o player
		if (instance_exists(player))
		{
			var _dist = point_distance(x, y, player.x, player.y);
			
			if (_dist < 300)
			{
				estado = "movendo"	
			}
		}
		
		break;	
	}
	#endregion
	
	#region movendo 
	case "movendo":
	{
		if (sprite_index != boss_andando)
		{
			sprite_index = boss_andando;
			image_index = 0;
		}
		
		
		//perseguindo o player
		if (instance_exists(player))
		{
			//distancia para o player
			var _dist = point_distance(x, y, player.x, player.y);
			var _dir = point_direction(x, y, player.x, player.y);
			
			if (_dist > 90 )
			{
			//define a velocidade
			velh = lengthdir_x(max_velh, _dir);
			}
			else
			{
				//estando no alcance do player para e ataca
				velh = 0;
				estado = "ataque";
			}
		}
		
		
		break;
	}
	#endregion
	
	case "ataque":
	{
		atacando_boss(boss_atacando, 7, 10, -sprite_height/1.7, sprite_width/5)
		break;
	}
	
	case "dano recebido":
	{
		leva_dano(boss_dano_recebido, 2);
		break;
	}
	
	case "morrendo":
	{
		morrendo(boss_morrendo);
		break;
	}
	
}