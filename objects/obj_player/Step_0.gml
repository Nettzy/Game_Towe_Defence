
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


<<<<<<< HEAD:objects/obj_personagem/Step_0.gml
=======

>>>>>>> 1e335a53e755b1148ea5f4d6645262cef40b35dd:objects/obj_player/Step_0.gml
usa_arma();

controles();

olhar_mouse();

move_and_collide(velh, velv, all);

