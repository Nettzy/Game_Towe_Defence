// Vida e stats
life = 3;
speed_mov = 2;

// Pathfinding
path = path_add();
mp_grid = mp_grid_create(0, 0, room_width / 32, room_height / 32, 32, 32);

// Começa a buscar o caminho
find_path();

function find_path() {
    mp_grid_clear_all(mp_grid);
    
    // Adiciona obstáculos ao grid (coloque a layer/objeto que bloqueia o caminho)
    mp_grid_add_instances(mp_grid, obj_parede, false); // troque obj_parede pelo seu objeto de colisão
    
    // Calcula o melhor caminho até obj_interacao
    var found = mp_grid_path(
        mp_grid,
        path,
        x, y,
        obj_interacao.x, obj_interacao.y,
        true // permite diagonal
    );
    
    if (found) {
        path_start(path, speed_mov, path_action_stop, false);
    }
}