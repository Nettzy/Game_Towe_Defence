wave_atual = 1;
wave_duracao = 30; 
wave_timer = wave_duracao * room_speed;
spawn_intervalo = room_speed * 2;
spawn_timer = spawn_intervalo;
wave_ativa = false;
spawn_w = sprite_width * image_xscale;
spawn_h = sprite_height * image_yscale;
mostrar_mensagem = false;
mensagem_timer = 0;
wave_concluida = false;
wave_iniciada = false;
// NÃO inicializa global.iniciar_proxima_wave aqui!
global.banker_liberado = true;