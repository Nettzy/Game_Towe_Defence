move_dir = 0

vel  = 0; 
max_vel = 1.5;
velh = 0;
velv = 0;

arma = noone;

xcale = 1;

olhar_mouse = function()
{
	xscale = mouse_x - x != 0 ? sign(mouse_x - x) : 1;
}
usa_arma = function()
{
	if (arma)
	{
		var _atirar = mouse_check_button(mb_left);
		arma.atirar = _atirar
		
		var _dir = point_direction(x,y,mouse_x,mouse_y);
		
		var _x = x + lengthdir_x(sprite_width + 5, _dir);
		var _y = y + lengthdir_y(sprite_height + 5, _dir);
		
		arma.x = _x;
		arma.y = _y;
		
		arma.image_angle = _dir;
	}
}

// Ajusta a câmera ao tamanho da janela automaticamente
