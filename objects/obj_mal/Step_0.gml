// Anda em direção ao obj_interacao
move_towards_point(obj_interacao.x, obj_interacao.y, 1.8);

// Ao encostar causa dano e some
if (distance_to_object(obj_interacao) < 5) {
    with (obj_interacao) {
        life -= 20;
    }
    instance_destroy();
}

depth = -bbox_bottom;

if (hp <= 0)
{
	instance_destroy();
}