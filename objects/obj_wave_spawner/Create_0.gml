wave_atual = 1;
wave_duracao = 30; 
wave_timer = wave_duracao * room_speed;

// Intervalo entre spawns (em frames)
spawn_intervalo = room_speed * 2; // 1 inimigo a cada 2 segundos
spawn_timer = spawn_intervalo;

wave_ativa = false;

// Área de spawn baseada no tamanho do sprite/objeto
spawn_w = sprite_width;
spawn_h = sprite_height;

mostrar_mensagem = false;
mensagem_timer = 0;

wave_concluida = true;

// Globais de controle
global.iniciar_proxima_wave = false;
global.banker_liberado = true; // banker liberado no início