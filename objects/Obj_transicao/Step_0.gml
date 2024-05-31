/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


if (mudei) {
    alpha -= 0.02;
} else {
    alpha += 0.02;
}

if (alpha >= 1 && !mudei) {
    room_goto(destino);
    with (player) {
        x = other.destino_x;
        y = other.destino_y;
    }
    mudei = true;
}

if (mudei && alpha <= 0) {
    instance_destroy();
}


/*if (mudei)
{
	alpha -= .02;
}
else
{
	alpha += .02;
}

if (alpha >= 1 && !mudei)
{
	room_goto(destino);	
	
	player.x = destino_x;
	player.y = destino_y;
}

if (mudei && alpha <= 0)
{
	instance_destroy();
}