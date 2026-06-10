// Anda em direção ao obj_interacao
move_towards_point(obj_interacao.x, obj_interacao.y, 2);

// Ao encostar causa dano e some
if (distance_to_object(obj_interacao) < 5) {
    with (obj_interacao) {
        life -= 20;
    }
    instance_destroy();
}