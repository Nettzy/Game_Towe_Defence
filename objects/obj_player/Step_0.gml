if (global.pausado)
{
    velh = 0;
    velv = 0;
    exit;
}

depth = -bbox_bottom;

controles = function()
{
direita = keyboard_check(ord("D"));
esquerda = keyboard_check(ord("A"));
cima = keyboard_check(ord("W"));
baixo  = keyboard_check(ord("S"));

show_debug_message(arma);

if(cima xor baixo or esquerda xor direita)
{
move_dir = point_direction(0,0, (direita - esquerda),(baixo - cima));
vel = max_vel;
}
else
{
vel = lerp(vel,0,0.1);
}

velh = lengthdir_x(vel, move_dir);
velv = lengthdir_y(vel, move_dir);


}


usa_arma();

controles();

olhar_mouse();

move_and_collide(velh, velv, all);

