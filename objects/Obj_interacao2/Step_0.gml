mostrar_botao = false;

if (place_meeting(x, y, obj_player))
{
    mostrar_botao = true;
    
    if (keyboard_check_pressed(ord("E")))
    {
		global.iniciar_proxima_wave = true;
        // Reposiciona o player ANTES de trocar de room
        with (obj_player)
        {
            x = 490;
            y = 310;
        }
        room_goto(Room1);
    }
}