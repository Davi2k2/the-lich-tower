/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _chao = place_meeting(x, y + 1, obj_block)

if (!_chao)
{
	velv += GRAVIDADE * massa * global.vel_mult;	
}

switch(estado)
{
	#region parado
	case "parado":
	{
		timer_estado++;
		
		if (sprite_index != slime_andando)
		{
			sprite_index = slime_andando;
			image_index = 0;
		}
		
		image_index %= 4;
		
		if (random(timer_estado) > 500)
		{
			estado = choose("parado", "movendo");
			timer_estado = 0;
		}
		
		scr_ataque_player_perto(player, sprite_width, xscale);
		
		
		break;
	}
	#endregion
	
	#region ataque
	case "ataque":
	{
		atacando(slime_ataque, 2, 5, sprite_width/2, -sprite_height/3);
		break;
	}
	#endregion
	
	#region movendo
	case "movendo":
	{
		timer_estado++;
		if (sprite_index != slime_andando)
		{
			sprite_index = slime_andando;
			image_index = 0;
		}
		
		//ajustando a sprite, dizendo por qual ele vai começar e terminar
		image_index = clamp(image_index, 3, 8);
		
		//velocidade de movimento
		if (mid_velh == 0)
		{
			mid_velh = choose(-.2, .2);	
		}
		
		if(random(timer_estado) > 200)
		{
			estado = choose("parado", "parado", "movendo");
		}
		
		break;
		
	}
	#endregion
	
	#region dano recebido
	case "dano recebido":
	{
		leva_dano(slime_dano_recebido, image_number-1);
		break;
	}
	#endregion
	
	#region morrendo
	case "morrendo":
    {
		morrendo(slime_morrendo);
		break;
    }
	#endregion
	
}