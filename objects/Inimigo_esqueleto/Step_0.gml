/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


var _chao = place_meeting(x, y + 1, obj_block);

if (!_chao) 
{
	velv += GRAVIDADE * massa * global.vel_mult;
}


//if (mouse_check_button_pressed(mb_right)) 
//{
//	estado = "ataque"	
//}

//scr_ataca_player_melee(player, dist, xscale);




switch(estado)
{
	#region parado
	case "parado":
	{
		mid_velh = 0;
		velh = 0;
		timer_estado++;
		if(sprite_index != Inimigo_esqueleto_parado)
		{
			image_index = 0;	
		}
		sprite_index = Inimigo_esqueleto_parado;
		
		if (position_meeting(mouse_x, mouse_y, self))
		{
			if (mouse_check_button_pressed(mb_right))
			{
				estado = "dano recebido"
			}
		}
		
		if (irandom(timer_estado) > 300)
		{
			estado = choose("walk", "parado", "walk");
			timer_estado = 0;
		}
		scr_ataque_player_perto(player, dist, xscale);
		
		break;
	}
	#endregion
	
	#region movendo
	case "walk":
	{
		
		timer_estado++;
		if (sprite_index != Inimigo_esqueleto_walk)
		{
			image_index = 0;
			mid_velh = choose (.5, -.5) * global.vel_mult;
		}
		sprite_index = Inimigo_esqueleto_walk;
		
		//quando encosta em algo muda a direção
		if (place_meeting(x + mid_velh, y, obj_block))
		{
			mid_velh *= -1;	
		}
		
		if (irandom(timer_estado) > 300)
		{
			estado = choose("parado", "parado", "walk");
			timer_estado = 0;
		}
		scr_ataque_player_perto(player, dist, xscale);
		
		break;
	}
	#endregion
	
	#region ataque
	case "ataque":
	{
		atacando(Inimigo_esqueleto_ataque, 8, 15, sprite_width/2, -sprite_height/3);
		break;
	}
	#endregion
	
	#region dano recebido
	case "dano recebido":
    {
		leva_dano(Inimigo_esqueleto_dano_recebido, 3);
        break;
    }
	#endregion
	
	#region morrendo
    case "morrendo":
    {
		morrendo(Inimigo_esqueleto_morrendo);
		break;
    }
	#endregion
}

