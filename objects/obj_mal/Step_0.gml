// Se parou de se mover mas ainda não chegou, recalcula
if (path_position == 1 || speed == 0) {
    find_path();
}

// Verifica se chegou no obj_interacao
if (distance_to_object(obj_interacao) < 5) {
    // Causa dano
    with (obj_interacao) {
        life -= 1;
    }
    // Inimigo some
    instance_destroy();
}

// Chame isso de fora: with(obj_mal) { take_damage(1); }
function take_damage(dmg) {
    life -= dmg;
    if (life <= 0) {
        instance_destroy();
    }
}

path_delete(path);
mp_grid_destroy(mp_grid);