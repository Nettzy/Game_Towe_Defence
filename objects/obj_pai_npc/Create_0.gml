vida_max = 1;
vida_atual = vida_max;

dano = false;
dano_timer = 0;
tempo_dano = room_speed / 2;

// tomando dano
leva_dano = function(_dano)
{
	if (_dano == undefined) vida_atual -= 1;
	
	else vida_atual -= _dano;
	
	dano = true;
}