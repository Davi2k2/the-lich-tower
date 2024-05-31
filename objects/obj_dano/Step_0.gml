/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var outro;
var outro_list = ds_list_create();
var quantidade = instance_place_list(x , y, entidade, outro_list, 0);


// batendo em varios personagens
for (var i = 0; i < quantidade; i++)
{
	var atual = outro_list [| i];
	
	//caso queira ter a possibilidade de deixar o personagem invencivel por uns segundos
	/*if(atual.invencivel)
	{
		continue;	
	}
	*/
	
	if (object_get_parent(atual.object_index) != object_get_parent(pai.object_index))
	{
		
		var pos = ds_list_find_index(aplicar_dano, atual);
		if (pos == -1)
		{
			ds_list_add(aplicar_dano, atual);	
		}
		
	}
}

//aplicando o dano
var tam = ds_list_size(aplicar_dano);
for (var i = 0; i < tam; i++)
{
	outro = aplicar_dano[| i].id;
	
	if (outro.vida_atual > 0 )
	{
		if (outro.delay <= 0)
		{
			outro.estado = "dano recebido"
			outro.image_index = 0;
		}
		outro.vida_atual -= dano;
		//instance_destroy();
		
		//fazendo perceber deu hit no inimigo
		if (object_get_parent(outro.object_index) == Inimigo_pai)
		{
			screenshake(2);
			
			if (outro.vida_atual <= 0)
			{
				outro.estado = "morrendo"
			}
		}
		
	}
}

ds_list_destroy(aplicar_dano);
ds_list_destroy(outro_list);

if (morrer)
{
	instance_destroy();
}
else
{
	y  = pai.y;	
	
	if (quantidade)
	{
		instance_destroy();
	}
}

/*
if (outro)
{
		if (outro.id != pai)
		{
			// fazendo o inimigo não se bater quando for do mesmo tipo
			// caso queira que eles se deem dano so comentar as linhas 12 e 13
			var papi = object_get_parent(outro.object_index);
			if (papi != object_get_parent(pai.object_index))
			{
				if (outro.vida_atual > 0 )
				{
					outro.estado = "dano recebido"
					outro.image_index = 0;
					outro.vida_atual -= dano;
					instance_destroy();
				}
			}	
			
		}
}