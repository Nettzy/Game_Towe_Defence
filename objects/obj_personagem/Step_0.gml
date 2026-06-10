
controles = function()
{
direita = keyboard_check(ord("D"));
esquerda = keyboard_check(ord("A"));
cima = keyboard_check(ord("W"));
baixo  = keyboard_check(ord("S"));

velh = (direita - esquerda) * vel;
velv = (baixo - cima) * vel;
}

if baixo{
 direc = 0;
 sprite_index = Spr_fren_para;
} else if cima{
     direc = 1;
	 sprite_index = Spr_cost_para;
} else{
     if direc == 0{
	 sprite_index = Spr_fren_para;
} else if direc ==1{
	sprite_index = Spr_cost_para;
      }
}


if esquerda{
 direc = 2;
 sprite_index = Spr_esqu_para;
} else if direita{
     direc = 3;
	 sprite_index = Spr_dir_para;
} else{
     if direc == 2{
	 sprite_index = Spr_esqu_para;
} else if direc ==3{
	sprite_index = Spr_dir_para;
      }
}




controles();

move_and_collide(velh, velv, all);

