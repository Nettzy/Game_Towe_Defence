
controles = function()
{
direita = keyboard_check(ord("D"));
esquerda = keyboard_check(ord("A"));
cima = keyboard_check(ord("W"));
baixo  = keyboard_check(ord("S"));
fire = mouse_check_button_pressed(mb_left)

if(cima || baixo or esquerda || direita)
{
move_dir = point_direction(0,0, (direita - esquerda),(baixo - cima));
vel = max_vel;
}
else
{
vel = 0;
}

velh = lengthdir_x(vel, move_dir);
velv = lengthdir_y(vel, move_dir);

if (fire)
{
var _tiro= instance_create_layer(x, y, "tiro", obj_tiro);
_tiro.speed = 10;
_tiro.direction = point_direction(x, y, mouse_x, mouse_y)

}
}


controles();

move_and_collide(velh, velv, all);

