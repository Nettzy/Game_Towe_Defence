desenha_sprite();

draw_set_colour(c_red);
draw_rectangle(x - 16, y - 24, x + 16, y - 20, false);

draw_set_colour(c_green);
draw_rectangle(x - 16, y - 24, x - 16 + (32 * (hp/hp_max)), y - 20, false);

draw_set_colour(c_white);
