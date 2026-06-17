event_inherited();

hp = 1;
hp_max = hp;

randomise();

xscale = 1
yscale = 1
sprite_index = Spr_inim_and

tempo_estado = room_speed / 4;
timer_dano = tempo_dano;

desenha_sprite = function()
{
draw_sprite_ext(sprite_index,image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha);
}


