
// Gatilho: player saiu do banker → inicia wave
if (global.iniciar_proxima_wave)
{
    global.iniciar_proxima_wave = false; // reseta o gatilho
    global.banker_liberado = false;      // bloqueia banker
    wave_ativa = true;
    wave_concluida = false;
    wave_timer = wave_duracao * room_speed;
    spawn_timer = spawn_intervalo;
}

// Verifica se a base foi destruída
if (instance_exists(obj_interacao) && obj_interacao.life <= 0)
{
    wave_ativa = false;
    wave_timer = 0;
    
    with (obj_mal)
        instance_destroy();
		
if (global.pausado) exit;

    // Clique nos botões
    if (mouse_check_button_pressed(mb_left))
    {
        var _mx = device_mouse_x_to_gui(0);
        var _my = device_mouse_y_to_gui(0);
        var _cy = display_get_gui_height() / 2;
        var _cx = display_get_gui_width() / 2;
        var _btn_w = 120;
        var _btn_h = 32;
        var _btn_gap = 20;
        var _btn_y = _cy + 50;
        var _btn_reiniciar_x = _cx - _btn_w - _btn_gap / 2;
        var _btn_sair_x = _cx + _btn_gap / 2;

// Destrói objetos persistentes para resetar corretamente
instance_destroy(obj_inventario);
instance_destroy(obj_interacao);
instance_destroy(obj_wave_spawner);
room_restart();

        if (_mx >= _btn_reiniciar_x && _mx <= _btn_reiniciar_x + _btn_w &&
            _my >= _btn_y && _my <= _btn_y + _btn_h)
            room_restart();

        if (_mx >= _btn_sair_x && _mx <= _btn_sair_x + _btn_w &&
            _my >= _btn_y && _my <= _btn_y + _btn_h)
            game_end();
    }
    exit;
}

// ESTADO 1: Wave ativa
if (wave_ativa)
{
    wave_timer--;
    
    spawn_timer--;
    if (spawn_timer <= 0)
    {
        spawn_timer = max(10, spawn_intervalo - wave_atual * 5);
        
        var _inimigo = instance_create_layer(
            x + irandom(spawn_w) - spawn_w / 2,
            y + irandom(spawn_h) - spawn_h / 2,
            "Instances", obj_mal
        );
        
        _inimigo.hp     = 1 + (wave_atual - 1);
        _inimigo.hp_max = _inimigo.hp;
    }
    
    if (wave_timer <= 0)
        wave_ativa = false;
    
    exit;
}

// ESTADO 2: Aguarda inimigos morrerem
if (!wave_ativa && !wave_concluida && !mostrar_mensagem)
{
    if (instance_number(obj_mal) == 0)
    {
        mostrar_mensagem = true;
        mensagem_timer = 2 * room_speed;
        wave_concluida = true;
        wave_atual++;
		
    }
    exit;
}

// ESTADO 3: Mostrando mensagem
if (mostrar_mensagem)
{
    mensagem_timer--;
    if (mensagem_timer <= 0)
        mostrar_mensagem = false;
}