/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
// draw = quanto de vida ele tem
// draw_line = range para ataque
event_inherited();

draw_text(x, y - 100, vida_atual);


draw_line(x, y - sprite_height/2, x + (dist * xscale), y - sprite_height/2);