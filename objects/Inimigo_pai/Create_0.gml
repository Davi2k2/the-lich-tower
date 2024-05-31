/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

///@method leva_dano(_sprite, _image_index)
leva_dano = function(_sprite, _image_index)
{
	delay = room_speed * 2;
		velh = 0;
		
		mid_velh = 0;
        if (sprite_index != _sprite)
        {
            image_index = 0;
            //vida_atual--;
        }
        sprite_index = _sprite;

        if (vida_atual > 0)
        {
            if(image_index > image_number-1)
            {
                estado = "parado";
            }
        }
        else
        {
            if (image_index >= _image_index)
            {
                estado = "morrendo";
            }
        }
}

//qual sprite vai usar, por qual ira começar o dano, por qual ira terminar o dano, distancia X do ataque e distancia y do ataque sempre em " - " para subir
///@method atacando()
///@args sprite_index image_index_dan_min image_index_max_max dist_x dist_y [xscale_dano] [yscale_dano]
atacando = function(_sprite_index, _image_index_dan_min, _image_index_dan_max, _dist_x, _dist_y, _xscale_dano, _yscale_dano)
{
	
	if (!_xscale_dano) _xscale_dano = 1;
	if (!_yscale_dano) _yscale_dano = 1;
	
	mid_velh = 0;
	velh = 0;
	if(sprite_index != _sprite_index)
	{
		sprite_index = _sprite_index;
		image_index = 0;
		posso = true;
		dano = noone;
	}
	
		
	if (image_index > image_number -1)
	{
		estado = "parado";
	}
		
		
	// esse image_index = esta dizendo de qual sprite ele vai começar a dar dano
	if (image_index >= _image_index_dan_min && dano == noone && image_index < _image_index_dan_max  && posso)
	{
		dano = instance_create_layer(x + _dist_x, y + _dist_y, layer, obj_dano);
		dano.dano = ataque;
		dano.pai = id;
		dano.image_xscale = _xscale_dano;
		dano.image_yscale = _yscale_dano;
		posso = false;
	}
		
	if (dano != noone && image_index >= _image_index_dan_max)
	{
		instance_destroy(dano);
		dano = noone;
	}
}
///@method atacando_boss()
///@args sprite_index image_index_dan_min image_index_max_max dist_x dist_y
atacando_boss = function(_sprite_index, _image_index_dan_min, _image_index_dan_max, _dist_x, _dist_y)
{
	mid_velh = 0;
	velh = 0;
	if(sprite_index != _sprite_index)
	{
		sprite_index = _sprite_index;
		image_index = 0;
		posso = true;
		dano = noone;
	}
	
		
	if (image_index > image_number -1)
	{
		estado = "parado";
	}
		
		
	// esse image_index = esta dizendo de qual sprite ele vai começar a dar dano
	if (image_index >= _image_index_dan_min && dano == noone && image_index < _image_index_dan_max  && posso)
	{
		dano = instance_create_layer(x + _dist_x, y + _dist_y, layer, obj_dano_boss);
		dano.dano = ataque;
		dano.pai = id;
		posso = false;
	}
		
	if (dano != noone && image_index >= _image_index_dan_max)
	{
		instance_destroy(dano);
		dano = noone;
	}
}
///@method morrendo(spreite_morrendo)
morrendo = function(_sprite_morrendo)
{
	mid_velh = 0;
	if (sprite_index != _sprite_morrendo)
	{
	image_index = 0;
	}
	sprite_index = _sprite_morrendo;

	if (image_index > image_number-1)
	{
	image_speed = 0;
	image_alpha -= .01;

	if (image_alpha <= 0) instance_destroy();
    }
}

